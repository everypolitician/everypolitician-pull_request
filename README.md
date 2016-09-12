# EveryPolitician Pull Request summary

Produces a summary of an EveryPolitician data pull request like [this one](https://github.com/everypolitician/everypolitician-data/pull/16984#issuecomment-246282991).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'everypolitician-pull_request'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install everypolitician-pull_request

## Usage

To print a summary of an [everypolitician-data](https://github.com/everypolitician/everypolitician-data) pull request as markdown, use the following:

```ruby
require 'everypolitician/pull_request'
puts Everypolitician::PullRequest::Summarizer.new(16984).summarize
```

Where `16984` is the pull request number in [everypolitician-data](https://github.com/everypolitician/everypolitician-data) that you want the review for.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/everypolitician/everypolitician-pull_request.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
