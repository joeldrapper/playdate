require "playdate"

describe Playdate::Week do
	let(:week_53_of_2001) { Playdate::Week.new(year: 2001, week: 53) }
	let(:week_1_of_2002) { Playdate::Week.new(year: 2002, week: 1) }
	let(:week_0_of_2022) { Playdate::Week.new(year: 2022, week: 0) }
	let(:week_1_of_2022) { Playdate::Week.new(year: 2022, week: 1) }
	let(:week_52_of_2022) { Playdate::Week.new(year: 2022, week: 52) }
	let(:week_53_of_2022) { Playdate::Week.new(year: 2022, week: 53) }
	let(:week_54_of_2022) { Playdate::Week.new(year: 2022, week: 54) }
	let(:week_1_of_2023) { Playdate::Week.new(year: 2023, week: 1) }

	class << self
		alias_method :test, :it
	end

	test "new" do
		expect(week_0_of_2022).to be == week_1_of_2022
		expect(week_53_of_2022).to be == week_52_of_2022
		expect(week_54_of_2022).to be == week_1_of_2023
	end

	test "<=>" do
		expect(week_53_of_2001 <=> week_1_of_2002).to be == -1
	end

	test "succ" do
		expect(week_53_of_2001.succ).to be == week_1_of_2002
	end
end
