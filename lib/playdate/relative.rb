module Playdate
	module Relative
		module Day
			def yesterday?
				@date == Date.today - 1
			end

			def today?
				@date == Date.today
			end

			def tomorrow?
				@date == Date.today + 1
			end
		end

		module Week
			def last_week?
			end

			def this_week?
			end

			def next_week?
			end
		end

		module Month
			def last_month?
			end

			def this_month?
			end

			def next_month?
			end
		end

		module Year
			def last_year?
			end

			def this_year?
			end

			def next_year?
			end
		end
	end
end
