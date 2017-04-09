# Github::Rake::Release

Rake Tasks for Automating Github Releases

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'github-rake-release'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install github-rake-release

## Usage

#### 1. Rakefile:

```ruby
require 'github/rake/release'
```

And list all available tasks:

    $ bundle exec rake -T

#### 2. Configuration

The gem try to find out the repository name and assume that the branch to be merged to master is **develop**.

We can customise these values, tho:

```ruby
# Rakefile

require 'github/rake/release'
Github::Rake::Release.configure do |config|
  config.respository = 'username/repository-name'
  config.merge_from = :development
end
```

#### 3. Github authentication:

Create a [personal access token](https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/) selecting the scope **repo** on Github.

Then, export it as:

    $ export GITHUB_ACCESS_TOKEN=your_github_token

And, then, authenticate on Github running:

    $ bundle exec rake github:auth

#### 4. Merges the develop<sup name="branch-name-customisation">[1](#branch-name-customisation-reference)</sup> branch into master:

Running:

    $ bundle exec rake github:merge

Will simply run:

    $ git fetch
    $ git checkout master
    $ git pull
    $ git merge origin/develop
    $ git push

> <a name="branch-name-customisation-reference">[1]</a> see configuration to customise the branch name. [↩](#branch-name-customisation)

#### 5. Release

Running:

    $ bundle exec rake github:release['v0.1.0', 'Release title', 'Release description']

Will run the merge task and create a release tag after merging using the provided parameters. 🚀

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/roalcantara/github-rake-release. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
