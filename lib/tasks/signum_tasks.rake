# frozen_string_literal: true

desc 'Release a new version'
namespace :signum do
  task :release do
    version_file = './lib/signum/version.rb'
    File.open(version_file, 'w') do |file|
      file.puts <<~EOVERSION
        # frozen_string_literal: true

        module Signum
          VERSION = '#{Signum::VERSION.split('.').map(&:to_i).tap { |parts| parts[2] += 1 }.join('.')}'
        end
      EOVERSION
    end
    module Signum
      remove_const :VERSION
    end
    load version_file
    puts "Updated version to #{Signum::VERSION}"

    `git commit lib/signum/version.rb -m "Version #{Signum::VERSION}"`
    `git push`
    `git tag #{Signum::VERSION}`
    `git push --tags`
  end
end
