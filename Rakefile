# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rake/testtask'
require 'everypolitician/pull_request/rake_task'
Everypolitician::PullRequest::RakeTask.new.install_tasks

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.test_files = FileList['test/**/*_test.rb']
end

require 'rubocop/rake_task'
RuboCop::RakeTask.new

task default: %i[rubocop test]
