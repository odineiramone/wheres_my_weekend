# Where's my weekend?

[![Build Status](https://travis-ci.org/OdineiRibeiro/wheres_my_weekend.svg?branch=master)](https://travis-ci.org/OdineiRibeiro/wheres_my_weekend)

## About

This gem provides some methods to help to deal with weekends! You can see how to use then on `Usage` session

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

- `weekend?` will return `true` if a date is a weekend day

```ruby
Time.new(2016, 12, 23).weekend?
# => false

Time.new(2016, 12, 24).weekend?
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
[Time.new(2016, 12, 23), Time.new(2016, 12, 24), Time.new(2016, 12, 25)].weekend_dates
# => [2016-12-24 00:00:00 -0200, 2016-12-25 00:00:00 -0200]
```

- `next_weekend` will return the next weekend from the given date

```ruby
Time.new(2016, 12, 25).next_weekend
# => [2016-12-31 00:00:00 -0200, 2017-01-01 00:00:00 -0200]
```

- `remove_weekends` will return a array of weekdays from a array of dates

```ruby
[Time.new(2016, 12, 23), Time.new(2016, 12, 24), Time.new(2016, 12, 25)].weekend_dates
# => [2016-12-23 00:00:00 -0200]
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/odineiribeiro/wheres_my_weekend. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
