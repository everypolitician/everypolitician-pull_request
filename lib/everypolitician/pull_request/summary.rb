require 'octokit'
require 'open-uri'

module Everypolitician
  module PullRequest
    class Summary
      class Error < StandardError; end

      attr_reader :pull_request_number

      def initialize(pull_request_number)
        @pull_request_number = pull_request_number
      end

      def as_markdown
        pull_request = github.pull_request(everypolitician_data_repo, pull_request_number)
        files = github.pull_request_files(everypolitician_data_repo, pull_request_number)
        popolo_before_after = FindPopoloFiles.from(files).map do |file|
          {
            path:   file[:filename],
            before: open(file[:raw_url].sub(pull_request[:head][:sha], pull_request[:base][:sha])).read,
            after:  open(file[:raw_url]).read,
          }
        end

        begin
          ReviewChanges.new(popolo_before_after).to_html
        rescue Octokit::UnprocessableEntity => e
          raise Error, "Unable to review pull request #{pull_request_number}: #{e.message}"
        end
      end

      def post_to_github
        comment = github.add_comment(
          everypolitician_data_repo,
          pull_request_number,
          as_markdown
        )
        puts "Success! Comment posted at #{comment[:html_url]}"
      rescue Octokit::Unauthorized
        abort 'unauthorized: Please set GITHUB_ACCESS_TOKEN in the ' \
          'environment and try again. https://github.com/settings/tokens'
      end

      def post_to_github_from_travis
        if pull_request_number && pull_request_number != 'false'
          post_to_github
        else
          warn 'Not building a pull request, skipping pull_request_summary'
        end
      end

      private

      def github
        @github ||= Octokit::Client.new.tap do |g|
          g.access_token = ENV['GITHUB_ACCESS_TOKEN']
        end
      end

      def everypolitician_data_repo
        ENV.fetch('EVERYPOLITICIAN_DATA_REPO', 'everypolitician/everypolitician-data')
      end
    end
  end
end
