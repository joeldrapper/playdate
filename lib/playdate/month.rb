module Playdate
	class Month
		include Relative::Months
		include Relative::Years

		WEEKS = {
			1 => [0, 1, 2, 3, 4, 5].freeze,
			2 => [5, 6, 7, 8, 9].freeze,
			3 => [9, 10, 11, 12, 13].freeze,
			4 => [13, 14, 15, 16, 17].freeze,
			5 => [17, 18, 19, 20, 21, 22].freeze,
			6 => [22, 23, 24, 24, 26].freeze,
			7 => [26, 27, 28, 29, 30].freeze,
			8 => [31, 32, 32, 33, 34, 35].freeze,
			9 => [35, 36, 37, 38, 39].freeze,
			10 => [39, 40, 41, 42, 43, 44].freeze,
			11 => [44, 45, 46, 47, 48].freeze,
			12 => [48, 49, 50, 51, 52, 53].freeze
		}.freeze

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

		def weeks
			Period::Weeks.new(first_week..last_week)
		end

		def days
			Period::Days.new(first_day..last_day)
		end

		def first_week
			Week.new(year: @date.year, week: WEEKS[month_of_year].first)
		end

		def last_week
			Week.new(year: @date.year, week: WEEKS[month_of_year].last)
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
			"#{self.class.name}(year: #{@date.year}, month: #{@date.month})"
		end
	end
end
