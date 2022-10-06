module Playdate
  class Month
		class Enumerator
			include Enumerable

			def initialize(range)
				@range = range
			end

			def each(&block)
				@range.each(&block)
			end

			def last
				@range.last
			end

			def size
				@range.last.to_i - @range.first.to_i + 1
			end
		end
	end
end
