require 'wheres_my_weekend/version'

SECONDS_PER_DAY = 86_400

# rubocop:disable Style/Documentation
class Time
  def weekend?
    saturday? || sunday?
  end

  def next_weekend
    [next_saturday, next_saturday.add_days(1)]
  end

  protected

  def last_saturday
    saturday? ? sub_days(7) : sub_days(wday + 1)
  end

  def next_saturday
    saturday? ? add_days(7) : add_days(6 - wday)
  end
end

class Time
  include WeekendCheck

  def add_days(n)
    self + n.days
  end

  def sub_days(n)
    self - n.days
  end
end

class DateTime
  include WeekendCheck

  def add_days(n)
    self + n
  end

  def sub_days(n)
    self - n
  end
end

class Array
  def any_weekend?
    map(&:weekend?).any?
  end

  def weekend_dates
    reject { |date| !date.weekend? }
  end

  def remove_weekends
    reject(&:weekend?)
  end
end

class Integer
  def days
    self * SECONDS_PER_DAY
  end
end
