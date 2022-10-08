module Playdate
	class Week
		include Relative::Weeks
		include Relative::Months
		include Relative::Years

		def initialize(year:, week:)
			@date = Date.strptime("#{year}-#{week}", "%Y-%W")
		rescue
			case week
			when 0
				@date = Date.strptime("#{year}-#{1}", "%Y-%W")
			when 53
				@date = Date.strptime("#{year}-#{52}", "%Y-%W")
			when 54
				year += 1
				week = 0
				retry
			end
		end

		def year
			@year ||= Year.new(year: @date.year)
		end

		def number
			@date.strftime("%W").to_i
		end

		def <=>(other)
			case year <=> other.year
			when -1
				-1
			when 0
				number <=> other.number
			when 1
				1
			end
		end

		def succ
			self.class.new(year: @date.year, week: number + 1)
		end
	end
end
