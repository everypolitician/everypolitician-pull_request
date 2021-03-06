# frozen_string_literal: true

module Everypolitician
  module PullRequest
    class Report
      class Base
        attr_reader :before, :after

        def initialize(popolo_before, popolo_after)
          @before = popolo_before
          @after  = popolo_after
        end
      end
    end
  end
end
