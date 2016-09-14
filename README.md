# EveryPolitician Pull Request summary

This is the code the EverPolitician bot uses to inspect data pull requests (specifically those are on the
[everypolitician-data](https://github.com/everypolitician/everypolitician-data) repo)
and add helpful summaries to them. The bot writes the summary as a comments on the Pull Request
(for example [like this](https://github.com/everypolitician/everypolitician-data/pull/13742#issuecomment-231612271)
or [this](https://github.com/everypolitician/everypolitician-data/pull/13771#issuecomment-231652178)). The summary
helps the human who then decides whether or not to merge the data.

Read a full description at the bot's blog:
"[I'm a bot who comments](https://medium.com/@everypolitician/i-m-a-bot-who-comments-d1d93b6cab63)".

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
puts Everypolitician::PullRequest::Summary.new(16984).as_markdown
```

Where `16984` is the pull request number in [everypolitician-data](https://github.com/everypolitician/everypolitician-data) that you want the review for.

### Integration with rake

To add the rake tasks put the following in your `Rakefile`:

```ruby
require 'everypolitician/pull_request/rake_task'
Everypolitician::PullRequest::RakeTask.new.install_tasks
```

Then you can run the following tasks:

    bundle exec rake pull_request_summary:print
    bundle exec rake pull_request_summary:comment
    bundle exec rake pull_request_summary:travis

For a description of these tasks run:

    bundle exec rake -T

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/everypolitician/everypolitician-pull_request.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
