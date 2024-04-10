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

  spec.files = Dir.chdir(File.expand_path("..", __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.add_dependency 'pg'
  spec.add_dependency 'rails', '> 6.0'
  spec.add_dependency 'state_machines-activerecord'

  spec.add_development_dependency 'auxilium', '~> 3'
  spec.add_development_dependency 'sqlite3'

  spec.add_dependency "slim-rails", "~> 3"
  spec.add_dependency 'tailwindcss-rails'
  spec.add_dependency 'importmap-rails'
  spec.add_dependency 'turbo-rails'
  spec.add_dependency 'stimulus-rails'
  spec.add_dependency 'view_component'
end
