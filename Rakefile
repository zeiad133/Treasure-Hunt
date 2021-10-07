# frozen_string_literal: true

# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.
require_relative 'config/application'
Rails.application.load_tasks

if Rails.env.development?
  require 'rspec/core/rake_task'
  require 'rubocop/rake_task'

  Rake::Task['spec'].clear
  RSpec::Core::RakeTask.new(:spec)
  # Run `rails rubocop:auto_correct` instead of `rubocop -a` to fix the files properly
  RuboCop::RakeTask.new

  task(:default).clear
  task(default: %w(rubocop spec))
end
