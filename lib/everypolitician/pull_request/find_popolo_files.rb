# frozen_string_literal: true

module Everypolitician
  module PullRequest
    class FindPopoloFiles
      POPOLO_FILE_REGEX = /ep-popolo-v(\d+\.)?(\d+\.)?\d+\.json$/

      def self.from(files)
        files.select { |file| file[:filename].match(POPOLO_FILE_REGEX) }
      end
    end
  end
end
