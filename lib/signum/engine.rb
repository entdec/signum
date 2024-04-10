require 'slim'
require 'tailwindcss-rails'
require "importmap-rails"
require "turbo-rails"
require "stimulus-rails"
require "state_machines-activerecord"
require "view_component"

module Signum
  class Engine < ::Rails::Engine
    isolate_namespace Signum

    initializer 'signum.assets' do |app|
      app.config.assets.paths << root.join("app/javascript")
      app.config.assets.paths << root.join("app/components")
      app.config.assets.paths << root.join("vendor/javascript")
      app.config.assets.precompile += %w[signum_manifest]
    end

    initializer 'signum.importmap', before: "importmap" do |app|
      app.config.importmap.paths << root.join("config/importmap.rb")
      app.config.importmap.cache_sweepers << root.join("app/javascript")
      app.config.importmap.cache_sweepers << root.join("app/components")
      app.config.importmap.cache_sweepers << root.join("vendor/javascript")
    end
  end
end
