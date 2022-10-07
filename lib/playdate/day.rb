module Playdate
  class Day
		class << self
			def names
				I18n.t("playdate.date.day_names")
			end

			def abbreviated_names
				I18n.t("playdate.date.abbr_day_names")
			end
		end

		def initialize(year:, month:, day:)
			@date = Date.new(year, month, day)
		end

		attr_accessor :date

		def today?
			@date == Date.today
		end

		def yesterday?
			@date == Date.today - 1
		end

		def tomorrow?
			@date == Date.today + 1
		end

		def this_week?
		end

		def last_week?
		end

		def this_month?
		end

		def last_month?
		end

		def this_year?
		end

		def last_year?
		end

		# @return [Integer] The day of the month, from 1-31
		def day_of_month
			@date.day
		end

		# @return [Integer] The day of the year, from 1-366
		def day_of_year
			@date.yday
		end

		# @return [Integer] The day of the week 1-7
		def day_of_week
			@date.wday + 1
		end

		# @return [String] The day name — Monday, Tuesday, Wednesday...
		def name
			self.class.names[@date.wday]
		end

		def abbreviated_name
			self.class.abbreviated_names[@date.wday]
		end

		def abbreviated_name
			name[0, 3]
		end

		def month
			@month ||= Month.new(year: @date.year, month: @date.month)
		end

		def year
			@year ||= Year.new(year: @date.year)
		end

		# @return [Integer] comparison
		def <=>(other)
			@date <=> other.date
		end

		# @return [Playdate::Day] tomorrow
		def succ
			tomorrow = @date.next_day
			self.class.new(year: tomorrow.year, month: tomorrow.month, day: tomorrow.day)
		end
	end
end
