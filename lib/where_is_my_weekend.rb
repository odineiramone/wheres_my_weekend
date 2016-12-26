class Time
  def weekend_day?
    saturday? || sunday?
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
