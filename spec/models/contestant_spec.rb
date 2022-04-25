require "rails_helper"

RSpec.describe Contestant, type: :model do
  describe "relationships" do
    it { should belong_to :bachelorette }
    it { should have_many :outing_contestants }
    it { should have_many(:outings).through(:outing_contestants) }
  end

  describe "class methods" do
    it "displays unique list of all contestant hometowns" do
      bachelorette1 = Bachelorette.create!(name: "Hannah", season_number: 15)

      contestant1 = bachelorette1.contestants.create!(name: "Rob", age: 29, hometown: "Denver")
      contestant2 = bachelorette1.contestants.create!(name: "Mike", age: 34, hometown: "Greeley")
      contestant3 = bachelorette1.contestants.create!(name: "Ryan", age: 24, hometown: "Golden")
      contestant4 = bachelorette1.contestants.create!(name: "Alex", age: 40, hometown: "Denver")

      expect(Contestant.unique_hometowns).to eq(["Denver", "Greeley", "Golden"])
    end
  end
end
