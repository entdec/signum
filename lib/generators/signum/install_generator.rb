module Signum
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path("../templates", __FILE__)

    def create_initializer_file
      template "config/initializers/signum.rb"
    end

    def add_route
      return if Rails.application.routes.routes.detect { |route| route.app.app == Signum::Engine }
      route %(mount Signum::Engine => "/signum")
    end

    def copy_migrations
      rake "signum:install:migrations"
    end

    def tailwindcss_config
      rake "signum:tailwindcss:config"
    end
  end
end
