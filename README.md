# RSpec::LongTimeSpecsProfiler

A RSpec 2.x formatter which shows longest time spec files.

This formatter works in only RSpec 2.x. RSpec 3.x is not supported.

## Installation

Add this lines to your application's Gemfile:

```ruby
group :test do
  gem 'rspec-long_time_specs_profiler'
end
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rspec-long_time_specs_profiler

## Usage

Execute rspec command with `-f RSpec::LongTimeSpecsProfiler` option.

    $ bundle exec rspec -f RSpec::LongTimeSpecsProfiler
    
After tests, 10 longest time spec files are shown in your console.

If you want to show progress, please specify `-f progress` option as follows.

    $ bundle exec rspec -f progress -f RSpec::LongTimeSpecsProfiler

### More than 10 files?

You can use `--profile` option which specifies how many files are shown in longest time spec files.

    $ bundle exec rspec -f RSpec::LongTimeSpecsProfiler --profile 20

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ryu39/rspec-long_time_specs_profiler.
This project is intended to be a safe, welcoming space for collaboration,
and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

