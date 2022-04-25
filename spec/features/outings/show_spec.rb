require "rails_helper"

RSpec.describe "Outing Show Page" do
  it "displays outing attributes" do
    bachelorette1 = Bachelorette.create!(name: "Hannah", season_number: 15)
    bachelorette2 = Bachelorette.create!(name: "Mia", season_number: 11)

    contestant1 = bachelorette1.contestants.create!(name: "Rob", age: 29, hometown: "Denver")
    contestant2 = bachelorette1.contestants.create!(name: "Mike", age: 34, hometown: "Greeley")
    contestant3 = bachelorette1.contestants.create!(name: "Ryan", age: 25, hometown: "Golden")
    contestant4 = bachelorette2.contestants.create!(name: "Alex", age: 40, hometown: "Frisco")

    outing1 = Outing.create!(name: "Kickball", location: "Morrison", date: "09/12/19")
    outing2 = Outing.create!(name: "Hot Springs", location: "Glenwood", date: "09/20/19")

    OutingContestant.create!(outing: outing1, contestant: contestant1)
    OutingContestant.create!(outing: outing1, contestant: contestant2)
    OutingContestant.create!(outing: outing1, contestant: contestant3)
    OutingContestant.create!(outing: outing2, contestant: contestant4)

    visit outing_path(outing1.id)

    expect(page).to have_content("Kickball")
    expect(page).to have_content("Morrison")
    expect(page).to have_content("09/12/19")
    expect(page).to have_content("Count of Contestants: 3")
    expect(page).to have_content("Contestants: Rob, Mike, Ryan")
    expect(page).to_not have_content("Hot Springs")
    expect(page).to_not have_content("Glenwood")
    expect(page).to_not have_content("09/20/19")
    expect(page).to_not have_content("Count of Contestants: 1")
    expect(page).to_not have_content("Contestants: Alex")
  end
end
