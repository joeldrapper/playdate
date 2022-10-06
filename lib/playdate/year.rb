module Playdate
	class Year
		include Enumerable

		def initialize(year:)
			@date = Date.new(year)
		end

		attr_accessor :date

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
			first_month..last_month
		end

		def first_month
			Month.new(year: @date.year, month: 1)
		end

		def last_month
			Month.new(year: @date.year, month: 12)
		end
	end
end
