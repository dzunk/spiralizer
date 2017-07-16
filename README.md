# Spiralizer

Spiralizer converts a matrix or two-dimensional array into a string by
concatenating the values in a clockwise spiral pattern, and converting all
uppercase letters to lowercase.

For example, when given the matrix:

    A B C D
    E F G H
    I J K L

Spiralizer will "spiralize" it into the following string:

    "a b c d h l k j i e f g"

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'spiralizer'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install spiralizer

## Basic usage

You can call Spiralizer directly:

```ruby
foo = [['A', 'B'], ['C', 'D']]
Spiralizer.call(foo)      # "a b d c"
Spiralizer.spiralize(foo) # also "a b d c"
```

Or, for greater flexibility, instantiate your own Spiralizer:

```ruby
Spiralizer.new(strict: false).spiralize(['A', 'b']) # "a b"
```

## Advanced usage

### Error handling

Spiralizer exposes `spiralize` and `spiralize!`, which have different error
handling behavior. The bang method will raise an exception when provided an
unacceptable target, while the non-bang method will return false on error.

```ruby
foo = [['A', 'B'], ['c, 'd']]
Spiralizer.new(foo).spiralize! # LowercaseElementError
Spiralizer.new(foo).spiralize  # false

bar = [['A', 'B'], [3, 4]]
Spiralizer.new(bar).spiralize! # NumericElementError

baz = [['A', 'B'], ['&', 'D']]
Spiralizer.new(baz).spiralize! # InvalidElementError
```

### Promiscuous mode

By default, Spiralizer runs in "strict mode", which requires all matrix or array
elements to be uppercase letters. Spiralize also supports promiscuous mode, with
the parameter `strict: false`. In promiscuous mode, Sprializer does not enforce
the uppercase letter requirement, and will attempt to spiralize the provided
target regardless of element type.

```ruby
xyzzy = [[1, 2], [3, 4]]
Spiralizer.new(xyzzy).spiralize! # UnacceptableElementError
Spiralizer.new(xyzzy, strict: false).spiralize! # "1 2 4 3"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake spec` to run the tests. You can also run `bin/console` for an interactive
prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version, push
git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dzunk/spiralizer.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
