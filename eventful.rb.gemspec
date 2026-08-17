require_relative './lib/Eventful/VERSION'

class Gem::Specification
  def dependencies=(gems)
    gems.each{|gem| add_dependency(*gem)}
  end

  def development_dependencies=(gems)
    gems.each{|gem| add_development_dependency(*gem)}
  end
end

Gem::Specification.new do |spec|
  spec.name = 'eventful.rb'
  spec.version = Eventful::VERSION

  spec.summary = "Automatically change state with stateful.rb state machines."
  spec.description = "By defining predicate methods which are, with the addition of '?', named the same as state machine events, and then configuring an in memory or cron-based event loop, the state machine will change state automatically."

  spec.author = 'thoran'
  spec.email = 'code@thoran.com'
  spec.homepage = 'http://github.com/thoran/eventful'
  spec.license = 'MIT'

  spec.required_ruby_version = '>= 2.5'
  spec.require_paths = ['lib']

  spec.files = [
    Dir['test/**/*.rb'],
    Dir['lib/**/*.rb'],
    'CHANGELOG.md',
    'eventful.rb.gemspec',
    'Gemfile',
    'LICENSE.txt',
    'README.md',
  ].flatten

  spec.dependencies = %w{stateful.rb}

  spec.development_dependencies = %w{
    minitest
    minitest-spec-context
    activerecord
    sqlite3
  }
end
