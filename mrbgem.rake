require_relative 'lib/Eventful/VERSION'

MRuby::Gem::Specification.new('mruby-eventful') do |spec|
  spec.version = Eventful::VERSION

  spec.summary = "Automatically change state with Stateful state machines in mRuby."

  spec.authors = 'thoran'
  spec.license = 'MIT'

  spec.rbfiles = ['mruby/stub_requires.rb'] + (Dir.glob('lib/**/*.rb').reject{|f| f.include?('ActiveRecord')})

  spec.add_dependency 'mruby-metaprog', core: 'mruby-metaprog'
  spec.add_dependency 'mruby-eval', core: 'mruby-eval'
  spec.add_dependency 'mruby-array-ext', core: 'mruby-array-ext'
end
