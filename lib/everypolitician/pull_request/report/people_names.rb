# frozen_string_literal: true

module Everypolitician
  module PullRequest
    class Report
      class PeopleNames < Base
        def before_names
          @before_names ||= Hash[before.persons.map { |p| [p.id, p.name] }]
        end

        def after_names
          @after_names ||= Hash[after.persons.map { |p| [p.id, p.name] }]
        end

        def changed
          in_both = before_names.keys & after_names.keys
          in_both.reject { |id| before_names[id].casecmp?(after_names[id]) }.map do |id|
            {
              id:  id,
              was: before_names[id],
              now: after_names[id],
            }
          end
        end
      end
    end
  end
end
