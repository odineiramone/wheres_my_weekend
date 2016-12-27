require 'wheres_my_weekend/version'
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

  def last_saturday
    saturday? ? self - 7.days : self - (wday + 1).days
  end

  def next_saturday
    saturday? ? self + 7.days : self + (6 - wday).days
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

class Integer
  def days
    self * SECONDS_PER_DAY
  end
end
