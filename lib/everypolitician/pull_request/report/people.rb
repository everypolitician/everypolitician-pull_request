# frozen_string_literal: true

module Everypolitician
  module PullRequest
    class Report
      class People < Base
        def added
          after.persons - before.persons
        end

        def removed
          before.persons - after.persons
        end
      end
    end
  end
end
