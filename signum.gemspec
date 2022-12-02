$:.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'signum/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = 'signum'
  spec.version     = Signum::VERSION
  spec.authors     = ['Tom de Grunt']
  spec.email       = ['tom@degrunt.nl']
  spec.homepage    = 'https://github.com/entdec/signum'
  spec.summary     = 'Replacement for flash messages, also from background jobs'
  spec.description = 'Rails engine with replacement for flash messages, Signum allows for messages from background jobs.'
  spec.license     = 'MIT'

  spec.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  spec.add_dependency 'pg'
  spec.add_dependency 'rails', '> 6.0'
  spec.add_dependency 'state_machines-activemodel'

  spec.add_development_dependency 'auxilium', '~> 3'
  spec.add_development_dependency 'sqlite3'
end
