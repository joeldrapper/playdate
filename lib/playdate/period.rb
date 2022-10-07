module Playdate
	class Period < SimpleDelegator
		class Days < Period
			def size
				(last.date - first.date).to_i + 1
			end

			def in_batches_of(n)
				Enumerator.new do |yielder|
					(size / n).ceil.times do |g|
						from = first + (n * g)
						to = from + n

						yielder << self.class.new(from...to)
					end
				end
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
