module Playdate
	class Month
		class << self
			def names
				I18n.t("playdate.date.month_names")
			end

			def abbreviated_names
				I18n.t("playdate.date.abbr_month_names")
			end
		end

		attr_accessor :date

		def initialize(year:, month:)
			@date = Date.new(year, month)
		end

		names.each_with_index do |name, index|
			next unless name
			define_method("#{name.downcase}?") { to_i == index  }
		end

		def ==(other)
			@date == other.date
		end

		def <=>(other)
			@date <=> other.date
		end

		def succ
			self.class.new(year: next_month.year, month: next_month.month)
		end

		def days
			first_day..last_day
		end

		def first_day
			Day.new(year: @date.year, month: @date.month, day: 1)
		end

		def last_day
			Day.new(year: @date.year, month: @date.month, day: -1)
		end

		def year
			@year ||= Year.new(year: @date.year)
		end

		def name
			self.class.names[@date.month]
		end

		def month_of_year
			@date.month
		end

		def abbreviated_name
			self.class.abbreviated_names[@date.month]
		end

		alias_method :to_s, :name

		def inspect
			"#{name} #{year}"
		end
	end
end
