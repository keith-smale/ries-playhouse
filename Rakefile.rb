require 'rspec/core/rake_task'

SPEC_DIRECTORY = '_spec'

RSpec::Core::RakeTask.new(:spec) do |task|
  task.pattern = Dir.glob("#{SPEC_DIRECTORY}/**/*_spec.rb")
  task.rspec_opts = '--color'
end

task :serve do
  sh 'bundle exec jekyll serve --config _config.yml --watch --trace --port 4000 --host 0.0.0.0'
end

task :servequick do
  sh 'bundle exec jekyll serve --config _config.yml --watch --incremental --limit_posts 3 --port 4000 --host 0.0.0.0'
end

task :default => :spec