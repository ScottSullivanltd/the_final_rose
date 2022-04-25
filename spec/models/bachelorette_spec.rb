require "rails_helper"

RSpec.describe Bachelorette, type: :model do
  describe "relationships" do
    it { should have_many :contestants }
  end

  describe "class methods" do
    it "calculates average age of contestants" do
      bachelorette1 = Bachelorette.create!(name: "Hannah", season_number: 15)

      contestant1 = bachelorette1.contestants.create!(name: "Rob", age: 29, hometown: "Denver")
      contestant2 = bachelorette1.contestants.create!(name: "Mike", age: 34, hometown: "Greeley")
      contestant3 = bachelorette1.contestants.create!(name: "Ryan", age: 24, hometown: "Golden")

      expect(bachelorette1.contestants_avg_age).to eq(29.0)
    end
  end
end
