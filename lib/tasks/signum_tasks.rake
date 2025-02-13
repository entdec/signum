require "rails/generators"

namespace :signum do
  namespace :tailwindcss do
    desc "Configure your Tailwind CSS"
    task :config do
      Rails::Generators.invoke("signum:tailwind_config", ["--force"])
    end
  end
end

if Rake::Task.task_defined?("tailwindcss:build")
  Rake::Task["tailwindcss:build"].enhance(["signum:tailwindcss:config"])
  Rake::Task["tailwindcss:watch"].enhance(["signum:tailwindcss:config"])
end
