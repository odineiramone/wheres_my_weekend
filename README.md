# Where's my weekend

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'wheres_my_weekend'
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install wheres_my_weekend
```

## Usage

- `weekend_day?` will return `true` if a date is a weekend day

```ruby
Time.new(2016, 12, 23).weekend_day?
# => false

Time.new(2016, 12, 24).weekend_day?
# => true
```

- `any_weekend?` will return `true` if on a array of dates have any weekend day

```ruby
dates = [Time.new(2016, 12, 23), Time.new(2016, 12, 24), Time.new(2016, 12, 25)]
# => [2016-12-23 00:00:00 -0200, 2016-12-24 00:00:00 -0200, 2016-12-25 00:00:00 -0200]
dates.any_weekend?
# => true
```

- `weekend_dates` will return a array of weekend days from a array of dates

```ruby
dates.weekend_dates
# => [2016-12-24 00:00:00 -0200, 2016-12-25 00:00:00 -0200]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/odineiribeiro/wheres_my_weekend. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
