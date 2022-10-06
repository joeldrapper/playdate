module Playdate
	class Year
		def initialize(date)
			@date = date
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

		def to_s
			to_i.to_s
		end

		def leap?
			@date.leap?
		end

		def months
			Month::Enumerator.new(
				Month.new(Date.new(to_i, 1))..Month.new(Date.new(to_i, number_of_months))
			)
		end

		private

		def number_of_months
			Date.new(to_i, -1).month
		end
	end
end
