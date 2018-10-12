# frozen_string_literal: true

require 'erb'

module Everypolitician
  module PullRequest
    class ReviewChanges
      attr_reader :popolo_files

      def initialize(popolo_before_after)
        @popolo_files = popolo_before_after.map do |opts|
          ComparePopolo.parse(opts)
        end
      end

      def to_html
        template.result(binding)
      end

      def template
        @template ||= ERB.new(File.read(File.expand_path('../../../comment_template.md.erb', __dir__)))
      end
    end
  end
end
