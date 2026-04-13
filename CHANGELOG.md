# eventful/CHANGELOG.md

## 2.1.0 (20260413): Add mRuby support.
-----------------------------------------------------------------------------------------------------------------------

### +
1. mruby/stub_requires.rb
2. mruby/smoke_tests.rb
3. mruby/test_mruby-eventful
4. mrbgem.rake

### ~
1. lib/Eventful.rb: + Object.const_defined?(:ActiveRecord) for mRuby compatibility. In mRuby defined?() raises NameError instead of returning nil as with CRuby.
2. lib/Eventful/ActiveRecord/ClassMethods.rb: /stateful_states/stateful_state_machine/ (compatibility with stateful.rb 2.x).
3. test/Poro.rb: /stateful_states/stateful_state_machine/ (This was broken in 2.0.0.)
4. test/ActiveRecord.rb: /stateful_states/stateful_state_machine/ (This was broken in 2.0.0.)
5. test/ActiveRecordWhenNoFinalState.rb: /stateful_states/stateful_state_machine/ (This was broken in 2.0.0.)
6. eventful.rb.gemspec: ~ summary, description, homepage; /Ruby/MIT/ license; + dependencies=, development_dependencies= helpers; + CHANGELOG.md to files; + development deps (activerecord, sqlite3).
7. Gemfile: Use gemspec.
8. lib/Eventful/VERSION: /2.0.0/2.1.0/


## 2.0.0 (20260412): Replace using ObjectSpace with a registry for detecting active Poro objects.
-----------------------------------------------------------------------------------------------------------------------

### +
1. Eventful::Poro::InstanceMethods: Prepended initialize hook for automatic instance registration.
2. Eventful::Poro::ClassMethods#instances: Class-level instance registry.
3. Eventful::Poro::ClassMethods#register: Register an instance.
4. Eventful::Poro::ClassMethods#gc: Remove final-state instances from the registry.

### -
1. lib/ObjectSpace/self.select_objects.rb

### ~
1. Eventful::Poro::ClassMethods#active: Replace ObjectSpace with instance registry.
2. Eventful::Poro: + require InstanceMethods.
3. Eventful: + klass.prepend(Eventful::Poro::InstanceMethods) for Poro path.
4. lib/Eventful/VERSION: /1.0.0/2.0.0/


## 1.0.0 (20260412): Declared stable.
-----------------------------------------------------------------------------------------------------------------------

### ~
1. lib/Eventful/VERSION: /0.9.1/1.0.0/


## 0.9.1 (20260412): General tidying in preparation for 1.0.
-----------------------------------------------------------------------------------------------------------------------

### +
1. TODO (See notes.txt.)

### -
1. notes.txt (Now TODO.)

### ~
1. .gitignore: + \*.gem, Gemfile.lock, .claude
2. eventful.rb.gemspec: - spec.date
3. eventful.rb.gemspec: ~ spec.required_ruby_version: >= /1.8.6/2.5/


## 0.9.0 (20260412): Update tests for Minitest 6 and later versions of ActiveRecord.
-----------------------------------------------------------------------------------------------------------------------

### ~
1. test/ActiveRecord.rb: Use \_(actual).must_equal(expected) syntax.
2. test/ActiveRecord.rb: Apply an ActiveRecord version for migrations.
3. test/ActiveRecordWhenNoFinalState.rb: Use \_(actual).must_equal(expected) syntax.
4. test/ActiveRecordWhenNoFinalState.rb: Apply an ActiveRecord version for migrations.
5. test/Poro.rb: Use \_(actual).must_equal(expected) syntax.


## 0.8.0 (20250728)
-----------------------------------------------------------------------------------------------------------------------

### +
1. lib/Eventful/VERSION.rb
2. CHANGELOG.md

### ~
1. eventful.rb.gemspec: + spec.add_dependency('stateful.rb')
2. eventful.rb.gemspec: /github.com\/thoran\/Eventful/github.com\/thoran\/eventful.rb/
3. eventful.rb.gemspec: ~ spec.licence: /MIT/Ruby/
4. eventful.rb.gemspec: /'0.7.0'/Eventful::VERSION/
