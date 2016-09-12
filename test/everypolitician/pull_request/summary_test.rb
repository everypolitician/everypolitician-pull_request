require 'test_helper'

describe 'Summary' do
  it 'produces a summary of the given pull request' do
    VCR.use_cassette('everypolitician-data-pr-16983') do
      summary = Everypolitician::PullRequest::Summary.new(16983).as_markdown
      summary.must_include 'Diana Marcela Márquez Canales'
      summary.must_include 'Luis Manuel Hernández León'
      summary.must_include 'Mirna Isabel Saldívar Paz'
    end
  end
end
