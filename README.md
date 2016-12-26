# Where is my weekend?

## Installation

```ruby
gem 'where_is_my_weekend'
```

## How to use

```ruby
dates = [Time.new(2016, 12, 23), Time.new(2016, 12, 24), Time.new(2016, 12, 25), Time.new(2016, 12, 26)]
# => [2016-12-23 00:00:00 -0200, 2016-12-24 00:00:00 -0200, 2016-12-25 00:00:00 -0200, 2016-12-26 00:00:00 -0200]

# 'weekend_day?' will return if a date is a weekend day
dates.first.weekend_day?
# => false

dates.second.weekend_day?
# => true

# 'any_weekend?' will return if on a array of dates have any weekend day
dates.any_weekend?
# => true

# 'weekend_dates' will return weekend days from a array of dates
dates.weekend_dates
# => [2016-12-24 00:00:00 -0200, 2016-12-25 00:00:00 -0200]
```
