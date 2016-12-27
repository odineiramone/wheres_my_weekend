require "wheres_my_weekend/version"
require 'pry'

SECONDS_PER_DAY = 86_400

class Time
  def weekend_day?
    saturday? || sunday?
  end

  def next_weekend
    if weekend_day?
      [next_monday.add_days(5), next_monday.add_days(6)]
    else
      [last_monday.add_days(5), last_monday.add_days(6)]
    end
  end

  protected

  def add_days(days = 1)
    self + (SECONDS_PER_DAY * days)
  end

  def last_monday
    add_days((wday - 1) * -1)
  end

  def next_monday
    add_days(8 - wday)
  end
end

class Array
  def any_weekend?
    map(&:weekend_day?).any?
  end

  def weekend_dates
    reject { |date| !date.weekend_day? }
  end
end
