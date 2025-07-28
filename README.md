# eventful.rb

Automatically change state with Stateful state machines.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'eventful.rb'
```

And then execute:

```
$ bundle install
```

Or install it yourself as:

```
$ gem install eventful.rb
```

## Usage

```ruby
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

  # An event that produces a boolean result and which corresponds with a state trigger, which for argument sake is true.
  def an_event?
    true
  end

  # Another event that produces a boolean result and which corresponds with a state trigger, which for argument sake is false
  def another_event?
    false
  end

  # Yet another event that produces a boolean result and which corresponds with a state trigger, which for argument sake is true.
  def yet_another_event?
    true
  end
end

machine = Machine.new
machine.current_state.name
# => :initial_state

Machine.run # Causes the state to transition from the initial_state through next_state and then to final_state.

machine.current_state.name
# => :final_state
```

## Contributing

1. Fork it (https://github.com/thoran/eventful.rb/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new pull request

## License

The gem is available as open source under the terms of the [Ruby License](https://opensource.org/licenses/MIT).
