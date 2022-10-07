module Playdate
	module Relative
		module Days
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

		module Weeks
			def last_week?
			end

			def this_week?
			end

			def next_week?
			end
		end

		module Months
			def last_month?
			end

			def this_month?
			end

			def next_month?
			end
		end

		module Years
			def last_year?
			end

			def this_year?
			end

			def next_year?
			end
		end
	end
end
