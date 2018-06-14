require "rubygems"
require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "rspec/core/rake_task"
require "rubocop/rake_task"
require "standalone_migrations"
StandaloneMigrations::Tasks.load_tasks

RSpec::Core::RakeTask.new(:spec)
RuboCop::RakeTask.new

task default: %i[rubocop spec]
