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
			to_i <=> other.to_i
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
	end
end
