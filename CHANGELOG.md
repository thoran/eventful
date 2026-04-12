# eventful/CHANGELOG.md

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
