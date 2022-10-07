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

		def day_of_month
			@date.day
		end

		def day_of_year
			@date.yday
		end

		def day_of_week
			@date.wday + 1
		end

		def name
			self.class.names[@date.wday]
		end

		def abbreviated_name
			self.class.abbreviated_names[@date.wday]
		end

		def month
			@month ||= Month.new(year: @date.year, month: @date.month)
		end

		def year
			@year ||= Year.new(year: @date.year)
		end

		def <=>(other)
			@date <=> other.date
		end

		def succ
			tomorrow = @date.next_day
			self.class.new(year: tomorrow.year, month: tomorrow.month, day: tomorrow.day)
		end
	end
end
