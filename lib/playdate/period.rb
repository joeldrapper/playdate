module Playdate
	class Period
		include Enumerable

		def inspect
			@range.inspect
		end

		def initialize(range)
			@range = range
		end

		def each(&)
			@range.each(&)
		end

		def last
			@range.last
		end

		class Days < Period
			def size
				(last.date - first.date).to_i + 1
			end
		end

		class Weeks < Period
		end

		class Months < Period
		end

		class Years < Period
		end
	end
end
