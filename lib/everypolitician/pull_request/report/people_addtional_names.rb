# frozen_string_literal: true

require_relative 'people_names'

module Everypolitician
  module PullRequest
    class Report
      class PeopleAdditionalNames < PeopleNames
        def changed
          changes.map do |id|
            {
              id:      id,
              name:    before_names[id],
              removed: (names_all_pre[id] - names_all_post[id]).to_a,
              added:   (names_all_post[id] - names_all_pre[id]).to_a,
            }
          end
        end

        private

        ALL_NAMES = lambda do |p|
          other_names = p.other_names.map { |n| n[:name] } rescue []
          (other_names | [p.name]).to_set
        end

        def names_all_pre
          @names_all_pre ||= before.persons.map { |p| [p.id, ALL_NAMES.call(p)] }.to_h
        end

        def names_all_post
          @names_all_post ||= after.persons.map { |p| [p.id, ALL_NAMES.call(p)] }.to_h
        end

        def in_both
          names_all_pre.keys & names_all_post.keys
        end

        def changes
          in_both.reject { |id| names_all_pre[id].map(&:downcase).to_set == names_all_post[id].map(&:downcase).to_set }
        end
      end
    end
  end
end
