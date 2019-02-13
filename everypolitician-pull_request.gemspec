# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'everypolitician/pull_request/version'

Gem::Specification.new do |spec|
  spec.name          = 'everypolitician-pull_request'
  spec.version       = Everypolitician::PullRequest::VERSION
  spec.authors       = ['Chris Mytton', 'Tony Bowden']
  spec.email         = ['team@everypolitician.org']

  spec.summary       = 'Produces a summary of EveryPolitician data pull requests'
  spec.homepage      = 'https://github.com/everypolitician/everypolitician-pull_request'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.3.0'

  spec.add_runtime_dependency 'activesupport'
  spec.add_runtime_dependency 'everypolitician-popolo'
  spec.add_runtime_dependency 'octokit', '~> 4.13'
  spec.add_runtime_dependency 'require_all'

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'pry', '~> 0.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rubocop', '~> 0.59.0'
  spec.add_development_dependency 'vcr', '~> 3.0.3'
  spec.add_development_dependency 'webmock', '~> 2.1'
end
