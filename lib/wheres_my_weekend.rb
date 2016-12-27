require "wheres_my_weekend/version"
require 'pry'

class Time
  def weekend_day?
    saturday? || sunday?
  end

  def next_weekend
    weekend_day? ? [self, plus_one_day] : plus_one_day.next_weekend
  end

  private

  def plus_one_day
    self + (60 * 60 * 24)
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
