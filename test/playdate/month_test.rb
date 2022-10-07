require "playdate"

describe Playdate::Month do
	let(:january) { Playdate::Month.new(year: 2022, month: 01) }
	let(:december) { Playdate::Month.new(year: 2022, month: 12) }
	let(:february) { Playdate::Month.new(year: 2022, month: 02) }
	let(:august) { Playdate::Month.new(year: 2022, month: 8) }
	let(:next_january) { Playdate::Month.new(year: 2023, month: 01) }

	class << self
		alias_method :test, :it
	end

	test "name" do
		expect(january.name).to be == "January"
		expect(december.name).to be == "December"
	end

	test "abbreviated_name" do
		expect(january.abbreviated_name).to be == "Jan"
		expect(december.abbreviated_name).to be == "Dec"
	end

	test "translation" do
		I18n.locale = :fr

		expect(january.name).to be == "Janvier"
		expect(december.name).to be == "Décembre"
		expect(february.name).to be == "Fèvrier"
		expect(august.name).to be == "Août"

		expect(january.abbreviated_name).to be == "Jan"
		expect(december.abbreviated_name).to be == "Déc"
		expect(february.abbreviated_name).to be == "Fèv"
		expect(august.abbreviated_name).to be == "Aoû"

		I18n.locale = :en
	end

	test "year" do
		expect(january.year).to be == Playdate::Year.new(year: 2022)
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
