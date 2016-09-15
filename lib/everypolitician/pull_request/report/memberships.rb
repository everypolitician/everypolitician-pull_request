module Everypolitician
  module PullRequest
    class Report
      class Memberships < Base
        def added
          @ma ||= (after_h.keys - before_h.keys).map { |k| after_h[k] }
        end

        def removed
          @mr ||= (before_h.keys - after_h.keys).map { |k| before_h[k] }
        end

        private

        def before_h
          @before_h ||= before.memberships.map { |m| [m.document, m] }.to_h
        end

        def after_h
          @after_h ||= after.memberships.map { |m| [m.document, m] }.to_h
        end
      end
    end
  end
end
