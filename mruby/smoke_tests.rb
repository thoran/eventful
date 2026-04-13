# mruby/smoke_tests.rb
# Smoke tests for mRuby compatibility.

# Run with: ./test_mruby-eventful

# --- Test helpers ---

def assert(description, &block)
  if block.call
    puts "  PASS: #{description}"
  else
    puts "  FAIL: #{description}"
    $failure_count += 1
  end
  $test_count += 1
end

$test_count = 0
$failure_count = 0

# --- 1. Module hooks ---

puts "1. Module hooks"

class HookTest
  include Eventful
end

assert("include wires up Stateful class methods"){HookTest.respond_to?(:stateful_state_machine)}
assert("include wires up Eventful class methods"){HookTest.respond_to?(:active)}
assert("include wires up Eventful run"){HookTest.respond_to?(:run)}
assert("include wires up Poro register"){HookTest.respond_to?(:register)}

# --- 2. Instance registration ---

puts
puts "2. Instance registration"

class Registrable
  include Eventful

  initial_state :alive do
    on :die => :dead
  end

  final_state :dead

  def die?
    false
  end
end

r1 = Registrable.new
r2 = Registrable.new

assert("new instances are automatically registered"){Registrable.active.size == 2}
assert("active includes r1"){Registrable.active.include?(r1)}
assert("active includes r2"){Registrable.active.include?(r2)}

# --- 3. State transitions via run ---

puts
puts "3. State transitions via run"

class Machine
  include Eventful

  initial_state :initial_state do
    on :an_event => :next_state
    on :another_event => :final_state
  end

  state :next_state do
    on :yet_another_event => :final_state
  end

  final_state :final_state

  def an_event?
    true
  end

  def another_event?
    false
  end

  def yet_another_event?
    true
  end
end

machine = Machine.new

assert("starts in initial state"){machine.current_state.name == :initial_state}
assert("one active instance"){Machine.active.size == 1}

Machine.run

assert("after first run: next_state"){machine.current_state.name == :next_state}
assert("still active"){machine.active?}

Machine.run

assert("after second run: final_state"){machine.current_state.name == :final_state}
assert("no longer active"){!machine.active?}

# --- 4. GC of final-state instances ---

puts
puts "4. GC of final-state instances"

assert("active returns empty after reaching final state"){Machine.active.size == 0}

# --- 5. memory_run with runtime limit ---

puts
puts "5. memory_run with runtime limit"

class TimedMachine
  include Eventful

  initial_state :running do
    on :tick => :running
  end

  def tick?
    true
  end
end

TimedMachine.new
start_time = Time.now
TimedMachine.run(1, 3)
elapsed = Time.now - start_time

assert("memory_run respects runtime limit"){elapsed >= 3 && elapsed < 5}

# --- Summary ---

puts
if $failure_count == 0
  puts "All #{$test_count} tests passed."
else
  puts "#{$failure_count} of #{$test_count} tests FAILED."
end
