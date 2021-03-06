# frozen_string_literal: true

module Everypolitician
  module PullRequest
    class Report
      class Wikidata < Base
        def changed
          prev = Hash[before.persons.map { |p| [p.id, p.wikidata] }]
          post = Hash[after.persons.map  { |p| [p.id, p.wikidata] }]
          in_both = prev.keys & post.keys
          in_both.reject { |id| prev[id] == post[id] }.map do |id|
            {
              id:  id,
              was: prev[id] || 'none',
              now: post[id] || 'none',
            }
          end
        end
      end
    end
  end
end
