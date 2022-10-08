module Playdate
	class Year
		include Relative::Years

		def initialize(year:)
			@date = Date.new(year)
		end

		attr_accessor :date

		def inspect
			"Playdate::Year(year: #{@date.year})"
		end

		def to_i
			@date.year
		end

		def <=>(other)
			to_i <=> other.to_i
		end

		def ==(other)
			to_i == other.to_i
		end

		def succ
			self.class.new(year: @date.next_year.year)
		end

		def to_s
			to_i.to_s
		end

		def leap?
			@date.leap?
		end

		def months
			Period::Months.new(first_month..last_month)
		end

		def weeks
			Period::Weeks.new(first_week..last_week)
		end

		def days
			Period::Days.new(first_day..last_day)
		end

		def first_month
			Month.new(year: @date.year, month: 1)
		end

		def last_month
			Month.new(year: @date.year, month: 12)
		end

		def first_week
			Week.new(year: @date.year, week: 0)
		end

		def last_week
			Week.new(year: @date.year, week: number_of_weeks)
		end

		def first_day
			date = Date.new(@date.year, 1, 1)
			Day.new(year: date.year, month: date.month, day: date.day)
		end

		def last_day
			date = Date.new(@date.year, 12, -1)
			Day.new(year: date.year, month: date.month, day: date.day)
		end

		def number_of_weeks
			@date.step(Date.new(@date.year,-1,-1)).select do |day|
				day.monday?
			end.size
		end
	end
end
