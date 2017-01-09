require 'wheres_my_weekend/version'

SECONDS_PER_DAY = 86_400

class Time
  def weekend_day?
    saturday? || sunday?
  end

  def next_weekend
    [next_saturday, next_saturday + 1.days]
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

  def remove_weekends
    reject(&:weekend_day?)
  end
end

class Integer
  def days
    self * SECONDS_PER_DAY
  end
end
