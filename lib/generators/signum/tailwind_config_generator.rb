require "rails/generators/base"

module Signum
  module Generators
    class TailwindConfigGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __dir__)
      desc "Configures tailwind.config.js and application.tailwindcss.css"

      def add_content_to_tailwind_config
        inject_into_file "config/tailwind.config.js", before: "],\n  theme: {" do
          "  // Signum content\n" +
            %w[/app/views/**/* /app/helpers/**/* /app/controllers/**/* /app/components/**/* /app/javascript/**/*.js /app/assets/**/*.css].map { |path| "    \"#{Signum::Engine.root}#{path}\"" }.join(",\n") +
            ",\n  "
        end
      end

      def add_content_application_tailwind_css
        inject_into_file "app/assets/stylesheets/application.tailwind.css", before: "@tailwind base;" do
          "@import '#{Signum::Engine.root}/app/assets/stylesheets/signum/application.css';\n"
        end
      end
    end
  end
end
