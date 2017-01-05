require 'test_helper'

describe Everypolitician::PullRequest::ComparePopolo do
  subject do
    Everypolitician::PullRequest::ComparePopolo.parse(
      path:   'foo/bar.json',
      before: open('test/fixtures/before.json').read,
      after:  open('test/fixtures/after.json').read
    )
  end

  it 'has a path' do
    assert_equal 'foo/bar.json', subject.path
  end

  it 'returns the added people' do
    assert_equal ['83af0ada-521a-4043-8b14-49dff73a9389'], subject.people_added.map(&:id)
  end

  it 'returns the removed people' do
    assert_equal ['3ec0c09e-462f-4b26-9596-bbcd0683f43e'], subject.people_removed.map(&:id)
  end

  it 'returns the added organizations' do
    assert_equal ['47e60c56-a663-4cad-b8d8-b63309fdd7c4'], subject.organizations_added.map(&:id)
  end

  it 'returns the removed organizations' do
    assert_equal ['88f2ef1f-f686-4496-a41c-98b6bb3ccaa7'], subject.organizations_removed.map(&:id)
  end

  it 'returns the removed terms' do
    assert_equal ['term/52'], subject.terms_removed.map(&:id)
  end

  it 'returns the added terms' do
    assert_equal ['term/54'], subject.terms_added.map(&:id)
  end

  it 'returns the removed elections' do
    assert_equal ['Q20311786'], subject.elections_removed.map(&:id)
  end

  it 'returns the added elections' do
    assert_equal ['Q16960120'], subject.elections_added.map(&:id)
  end
end
