require 'test_helper'

describe Everypolitician::PullRequest do
  it 'has a version number' do
    ::Everypolitician::PullRequest::VERSION.wont_be_nil
  end
end
