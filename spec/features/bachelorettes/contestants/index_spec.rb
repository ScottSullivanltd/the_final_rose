require "rails_helper"

RSpec.describe "Bachelorette's Contestants Index Page" do
  it "displays a bachelorette's contestants" do
    bachelorette1 = Bachelorette.create!(name: "Hannah", season_number: 15)
    bachelorette2 = Bachelorette.create!(name: "Mia", season_number: 11)

    contestant1 = bachelorette1.contestants.create!(name: "Rob", age: 29, hometown: "Denver")
    contestant2 = bachelorette1.contestants.create!(name: "Mike", age: 34, hometown: "Greeley")
    contestant3 = bachelorette1.contestants.create!(name: "Ryan", age: 25, hometown: "Golden")
    contestant4 = bachelorette2.contestants.create!(name: "Alex", age: 40, hometown: "Frisco")

    visit bachelorette_contestants_path(bachelorette1.id)

    expect(page).to have_content(contestant1.name)
    expect(page).to have_content(contestant2.name)
    expect(page).to have_content(contestant3.name)
    expect(page).to_not have_content(contestant4.name)
  end
end
