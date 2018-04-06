# HashKeyTransformer

`hash_key_transformer` makes it easy to transform a JSON-like data structure from one style of key to another (for example, from `camelCase` to `snake_case`).

The following transformations are supported:

|From      |To        |
|---       |---       |
|camel     |underscore|
|underscore|camel     |
|dash      |underscore|
|underscore|dash      |

`hash_key_transformer` can easily transform the following data structure from this:

```ruby
```
to this:

```ruby
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hash_key_transformer'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hash_key_transformer

## Usage

```ruby
require 'hash_key_transformer'
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub [here](https://github.com/accelecode/hash_key_transformer).
