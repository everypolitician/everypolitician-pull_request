# PullRequestSummarizer

Produces a summary of an EveryPolitician data pull request like [this one](https://github.com/everypolitician/everypolitician-data/pull/16984#issuecomment-246282991).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pull_request_summarizer'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pull_request_summarizer

## Usage

To print a summary of an [everypolitician-data](https://github.com/everypolitician/everypolitician-data) pull request as markdown, use the following:

```ruby
require 'pull_request_summarizer'
puts PullRequestSummarizer::Summarizer.new(16984).summary
```

Where `16984` is the pull request number in [everypolitician-data](https://github.com/everypolitician/everypolitician-data) that you want the review for.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/everypolitician/pull_request_summarizer.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
