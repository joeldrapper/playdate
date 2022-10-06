module Playdate
	class Month
		NAMES = {
			1 => "January",
			2 => "February",
			3 => "March",
			4 => "April",
			5 => "May",
			6 => "June",
			7 => "July",
			8 => "August",
			9 => "September",
			10 => "October",
			11 => "November",
			12 => "December",
		}.freeze

		def initialize(date)
			@date = date
		end

		NAMES.each do |number, name|
			define_method("#{name.downcase}?") { to_i == number }
		end

		def <=>(other)
			year_comparison = @date.year <=> other.date.year

			if year_comparison == 0
				@date.month <=> other.date.month
			else
				year_comparison
			end
		end

		def succ
			self.class.new(Date.new(@date.year, to_i + 1))
		end

		def year
			Year.new(@date)
		end

		def name
			NAMES[to_i]
		end

		alias_method :to_s, :name

		def to_i
			@date.month
		end

		def inspect
			"#{name} #{year}"
		end

		protected

		attr_accessor :date
	end
end
