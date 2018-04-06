# HashKeyTransformer

Ruby applications typically use underscore (also called "`snake_case`") as their convention for `Hash` keys. When sending data from a Ruby application to another application it is often useful to transform the style of hash keys to the style expected by the other application (`camelCase` or `dashed-case` for example). Likewise, when receiving data from an external application, it is often useful to transform the style of incoming hash keys to the underscore style common in Ruby.

`hash_key_transformer` makes it easy to transform a JSON-like data structure from one style of key to another.

The following transformations are supported:

|From      |To        |
|---       |---       |
|camel     |underscore|
|underscore|camel     |
|dash      |underscore|
|underscore|dash      |

Currently, all transformations output `Hash` keys as `:symbols`. This could be adjusted if there is interest.

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
