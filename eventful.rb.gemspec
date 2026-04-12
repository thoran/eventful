require_relative './lib/Eventful/VERSION'

Gem::Specification.new do |spec|
  spec.name = 'eventful.rb'

  spec.version = Eventful::VERSION

  spec.summary = "Automatically change state with Stateful state machines."
  spec.description = "By defining predicate methods which except for the addition of '?' matches a state machine event and then configuring an in memory or cron-based event loop, the state machine will be able to change state automatically."

  spec.author = 'thoran'
  spec.email = 'code@thoran.com'
  spec.homepage = 'http://github.com/thoran/eventful.rb'
  spec.license = 'Ruby'

  spec.required_ruby_version = '>= 2.5'

  spec.add_dependency('stateful.rb')
  spec.files = [
    'eventful.rb.gemspec',
    'Gemfile',
    Dir['lib/**/*.rb'],
    'README.md',
    Dir['test/**/*.rb']
  ].flatten
  spec.require_paths = ['lib']
end
