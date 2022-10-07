module Playdate
	class Week
		def initialize(year:, week:)
			@date = Date.commercial(year, week)
		end

		def number
			@date.cweek
		end

		def <=>(other)
			number <=> other.number
		end

		def succ
			self.class.new(year: @date.year, week: number + 1)
		end
	end
end
