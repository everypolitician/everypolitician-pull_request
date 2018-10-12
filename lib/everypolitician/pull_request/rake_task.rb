# frozen_string_literal: true

require 'rake'
require 'rake/tasklib'

module Everypolitician
  module PullRequest
    class RakeTask < ::Rake::TaskLib
      attr_reader :name

      def initialize(name = :pull_request_summary)
        @name = name
      end

      def install_tasks
        namespace(name) do
          desc 'Print a summary of the given pull request'
          task :print do
            puts pull_request_summary(pull_request_number).as_markdown
          end

          desc 'Post a summary of the given pull request as a comment'
          task :comment do
            pull_request_summary(pull_request_number).post_to_github
          end

          desc 'Generate and post a pull request summary from Travis'
          task :travis do
            pull_request_summary(ENV['TRAVIS_PULL_REQUEST']).post_to_github_from_travis
          end
        end
      end

      private

      def pull_request_summary(pull_request_number)
        # Lazy load so we doesn't slow down the load time of the Rakefile.
        require 'everypolitician/pull_request'
        Everypolitician::PullRequest::Summary.new(pull_request_number)
      end

      def pull_request_number
        ENV.fetch('PULL_REQUEST')
      rescue KeyError
        abort 'error: Please supply a pull request number in an environment' \
          ' variable, e.g. PULL_REQUEST=16984'
      end
    end
  end
end
