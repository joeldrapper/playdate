require "playdate"

describe Playdate::Year do
	let(:twenty_twenty_two) { Playdate::Year.new(Date.new(2022)) }
	let(:twenty_twenty_four) { Playdate::Year.new(Date.new(2024)) }

	class << self
		alias_method :test, :it
	end

	test "leap?" do
		expect(twenty_twenty_two.leap?).to be == false
		expect(twenty_twenty_four.leap?).to be == true
	end

	test "<=> comparison" do
		expect(twenty_twenty_two <=> twenty_twenty_four).to be == -1
		expect(twenty_twenty_four <=> twenty_twenty_two).to be == 1
	end

	test "== comparison" do
		expect(twenty_twenty_two).to be == twenty_twenty_two
		expect(twenty_twenty_two).to be != twenty_twenty_four
	end

	test "to_s" do
		expect(twenty_twenty_two.to_s).to be == "2022"
	end

	test "to_i" do
		expect(twenty_twenty_two.to_i).to be == 2022
	end
end
