$:.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'signum/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = 'signum'
  spec.version     = Signum::VERSION
  spec.authors     = ['Tom de Grunt']
  spec.email       = ['tom@degrunt.nl']
  spec.homepage    = 'https://localhost/'
  spec.summary     = 'Notifications'
  spec.description = 'Notifications'
  spec.license     = 'MIT'

  spec.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  spec.add_dependency 'pg'
  spec.add_dependency 'rails', '~> 6'
  spec.add_dependency 'state_machines-activemodel'
end
