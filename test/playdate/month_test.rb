require "playdate"

describe Playdate::Month do
	let(:january) { Playdate::Month.new(Date.new(2022, 01)) }
	let(:december) { Playdate::Month.new(Date.new(2022, 12)) }
	let(:next_january) { Playdate::Month.new(Date.new(2023, 01)) }

	class << self
		alias_method :test, :it
	end

	test "name" do
		expect(january.name).to be == "January"
		expect(december.name).to be == "December"
	end

	test "to_i" do
		expect(january.to_i).to be == 1
		expect(december.to_i).to be == 12
	end

	test "year" do
		expect(january.year).to be == Playdate::Year.new(Date.new(2022))
	end

	test "<=> comparison within the same year" do
		expect(january <=> december).to be == -1
		expect(december <=> january).to be == 1
	end

	test "<=> comparison with a different year" do
		expect(january <=> next_january).to be == -1
		expect(next_january <=> january).to be == 1
	end
end
