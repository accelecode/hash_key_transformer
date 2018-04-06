# HashKeyTransformer

`hash_key_transformer` makes it easy to transform a JSON-like data structure from one style of key to another (for example, from `camelCase` to `snake_case`).

Currently, all transformations normalize keys as `symbols`. This could be adjusted if there is interest.

The following transformations are supported:

|From      |To        |
|---       |---       |
|camel     |underscore|
|underscore|camel     |
|dash      |underscore|
|underscore|dash      |

This is useful when consuming APIs which provide JSON in `camelCase`. This is also useful when providing data to JavaScript client applications from a Ruby-based JSON API.

For example, when receiving data from a JavaScript client application, `hash_key_transformer` can easily transform the following data structure from this:

```ruby
{
  'keyName1' => 1,
  'keyName2' => [
    {
      'keyName3' => [
        {
          'keyName4' => 4,
          'keyName5' => 5
        }
      ]
    }
  ]
}
```

to this:

```ruby
{
  key_name1: 1,
  key_name2: [
    {
      key_name3: [
        {
          key_name4: => 4,
          key_name5: => 5
        }
      ]
    }
  ]
}
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

Use the appropriate transformation from this list:

* `#transform_camel_to_underscore`
* `#transform_underscore_to_camel`
* `#transform_dash_to_underscore`
* `#transform_underscore_to_dash`

For example:

```ruby
require 'hash_key_transformer'

transformed_object = HashKeyTransformer.transform_camel_to_underscore(object)
```

## Development

Source code for  the gem itself is located under the `src/gem` directory. Source code for the tests is located under `src/test`. Separating the test source code into a separate project allows the tests to consume the gem source code as a gem, which more closely mirrors actual use by other developers.

### Gem

Navigate to `src/gem` in your terminal.

After checking out the repo, run `bin/setup` to install gem dependencies.

You can also run `bin/console` for an interactive prompt that will allow you to experiment.

*Publishing Gem Releases*

To install this gem onto your local machine, run `bundle exec rake install`.

To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

### Tests

Navigate to `src/test` in your terminal.

Run `bin/setup` to install test dependencies.

Run `bundle exec rake` to run the tests.

## Contributing

Bug reports and pull requests are welcome on GitHub [here](https://github.com/accelecode/hash_key_transformer).
