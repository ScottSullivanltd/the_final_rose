require "rails_helper"

RSpec.describe "Contestant Show Page" do
  it "displays name and season number for contestant" do
    bachelorette1 = Bachelorette.create!(name: "Hannah", season_number: 15)
    bachelorette2 = Bachelorette.create!(name: "Mia", season_number: 11)

    contestant1 = bachelorette1.contestants.create!(name: "Rob", age: 29, hometown: "Denver")
    contestant2 = bachelorette1.contestants.create!(name: "Mike", age: 34, hometown: "Greeley")
    contestant3 = bachelorette1.contestants.create!(name: "Ryan", age: 25, hometown: "Golden")
    contestant4 = bachelorette2.contestants.create!(name: "Alex", age: 40, hometown: "Frisco")

    visit bachelorette_contestant_path(:bachelorette_id, contestant1.id)

    expect(page).to have_content(contestant1.name)
    expect(page).to have_content(bachelorette1.season_number)
    expect(page).to_not have_content(contestant2.name)
    expect(page).to_not have_content(bachelorette2.season_number)
  end

  it "lists names of outings the contestant has been on" do
    bachelorette1 = Bachelorette.create!(name: "Hannah", season_number: 15)

    contestant1 = bachelorette1.contestants.create!(name: "Rob", age: 29, hometown: "Denver")

    outing1 = Outing.create!(name: "Kickball", location: "Morrison", date: 09/12/19)
    outing2 = Outing.create!(name: "Hot Springs", location: "Glenwood", date: 09/20/19)
    outing3 = Outing.create!(name: "Helicopter Ride", location: "Arvada", date: 10/05/19)

    OutingContestant.create!(outing: outing1, contestant: contestant1)
    OutingContestant.create!(outing: outing2, contestant: contestant1)
    OutingContestant.create!(outing: outing3, contestant: contestant1)

    visit bachelorette_contestant_path(:bachelorette_id, contestant1.id)

    expect(page).to have_content("Kickball")
    expect(page).to have_content("Hot Springs")
    expect(page).to have_content("Helicopter Ride")
  end

  it "has a link to the outing's show page" do
    bachelorette1 = Bachelorette.create!(name: "Hannah", season_number: 15)

    contestant1 = bachelorette1.contestants.create!(name: "Rob", age: 29, hometown: "Denver")

    outing1 = Outing.create!(name: "Kickball", location: "Morrison", date: 09/12/19)
    outing2 = Outing.create!(name: "Hot Springs", location: "Glenwood", date: 09/20/19)
    outing3 = Outing.create!(name: "Helicopter Ride", location: "Arvada", date: 10/05/19)

    OutingContestant.create!(outing: outing1, contestant: contestant1)
    OutingContestant.create!(outing: outing2, contestant: contestant1)
    OutingContestant.create!(outing: outing3, contestant: contestant1)

    visit bachelorette_contestant_path(:bachelorette_id, contestant1.id)

    expect(page).to have_link("Kickball")

    click_link "Kickball"

    expect(current_path).to eq(outing_path(outing1.id))
    expect(current_path).to_not eq(outing_path(outing2.id))
  end
end
