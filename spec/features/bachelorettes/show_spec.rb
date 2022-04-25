require "rails_helper"

RSpec.describe "Bachelorette Show Page" do
  it "displays bachelorette's attributes" do
    bachelorette1 = Bachelorette.create!(name: "Hannah", season_number: 15)
    bachelorette2 = Bachelorette.create!(name: "Mia", season_number: 11)

    visit bachelorette_path(bachelorette1.id)

    expect(page).to have_content(bachelorette1.name)
    expect(page).to have_content(bachelorette1.season_number)
    expect(page).to_not have_content(bachelorette2.name)
    expect(page).to_not have_content(bachelorette2.season_number)
  end

  it "has a link to the bachelorette's contestants index page" do
    bachelorette1 = Bachelorette.create!(name: "Hannah", season_number: 15)
    bachelorette2 = Bachelorette.create!(name: "Mia", season_number: 11)

    visit bachelorette_path(bachelorette1.id)

    expect(page).to have_link("Hannah's Contestants")

    click_link "Hannah's Contestants"

    expect(current_path).to eq(bachelorette_contestants_path(bachelorette1.id))
    expect(current_path).to_not eq(bachelorette_contestants_path(bachelorette2.id))
  end

  it "displays average age of a bachelorette's contestants" do
    bachelorette1 = Bachelorette.create!(name: "Hannah", season_number: 15)
    bachelorette2 = Bachelorette.create!(name: "Mia", season_number: 11)

    contestant1 = bachelorette1.contestants.create!(name: "Rob", age: 29, hometown: "Denver")
    contestant2 = bachelorette1.contestants.create!(name: "Mike", age: 34, hometown: "Greeley")
    contestant3 = bachelorette1.contestants.create!(name: "Ryan", age: 24, hometown: "Golden")
    contestant4 = bachelorette2.contestants.create!(name: "Alex", age: 40, hometown: "Frisco")

    visit bachelorette_path(bachelorette1.id)

    expect(page).to have_content("Average Age of Contestants: 29.0")
  end
end
