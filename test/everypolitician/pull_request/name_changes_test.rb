# frozen_string_literal: true

require 'test_helper'

describe Everypolitician::PullRequest::ReviewChanges do
  let(:before_after) do
    [
      {
        before: {
          persons:       [
            { id: '123', name: 'Alice' },
            { id: '135', name: 'Bob'   },
            { id: '147', name: 'Carol' },
            { id: '159', name: 'Derek' },
            { id: '301', name: 'Zoë'   },
          ],
          organizations: [
            { id: 'abc', name: 'Rouge' },
            { id: 'def', name: 'Green' },
          ],
        }.to_json,
        after:  {
          persons:       [
            { id: '123', name: 'Alice'    },
            { id: '135', name: 'Bobby'    },
            { id: '147', name: 'Caroline' },
            { id: '169', name: 'Derek'    },
            { id: '301', name: 'ZOË'      },
          ],
          organizations: [
            { id: 'abc', name: 'Red'   },
            { id: 'def', name: 'Green' },
            { id: 'ghi', name: 'Blue'  },
          ],
        }.to_json,
        path:   'foo/bar.json',
      },
    ]
  end

  subject { Everypolitician::PullRequest::ReviewChanges.new(before_after).to_html }

  it 'knows about name changes' do
    assert subject.include?('- `135`: Bob → Bobby')
    assert subject.include?('- `147`: Carol → Caroline')
  end

  it 'ignores changes only in case' do
    refute subject.include?('ZOË')
  end
end
