class Date
  def to_playdate_year
    Playdate::Year.new(year: self.year)
  end

  def to_playdate_month
    Playdate::Month.new(year: self.year, month: self.month)
  end

  def to_playdate_week
    Playdate::Week.new(year: self.year, week: self.strftime("%W").to_i)
  end

  def to_playdate_day
    Playdate::Day.new(year: self.year, month: self.month, day: self.day)
  end
end
