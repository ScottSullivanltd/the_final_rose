require "rails_helper"

RSpec.describe "Bachelorette's Contestants Index Page" do
  it "displays all bachelorette's contestants info" do
    bachelorette1 = Bachelorette.create!(name: "Hannah", season_number: 15)
    bachelorette2 = Bachelorette.create!(name: "Mia", season_number: 11)

    contestant1 = bachelorette1.contestants.create!(name: "Rob", age: 29, hometown: "Denver")
    contestant2 = bachelorette1.contestants.create!(name: "Mike", age: 34, hometown: "Greeley")
    contestant3 = bachelorette1.contestants.create!(name: "Ryan", age: 25, hometown: "Golden")
    contestant4 = bachelorette2.contestants.create!(name: "Alex", age: 40, hometown: "Frisco")

    visit bachelorette_contestants_path(bachelorette1.id)

    expect(page).to have_content(contestant1.name)
    expect(page).to have_content(contestant1.age)
    expect(page).to have_content(contestant1.hometown)
    expect(page).to have_content(contestant2.name)
    expect(page).to have_content(contestant2.age)
    expect(page).to have_content(contestant2.hometown)
    expect(page).to have_content(contestant3.name)
    expect(page).to have_content(contestant3.age)
    expect(page).to have_content(contestant3.hometown)
    expect(page).to_not have_content(contestant4.name)
    expect(page).to_not have_content(contestant4.age)
    expect(page).to_not have_content(contestant4.hometown)
  end

  it "has link to individual bachelorette's individual contestant info" do
    bachelorette1 = Bachelorette.create!(name: "Hannah", season_number: 15)
    bachelorette2 = Bachelorette.create!(name: "Mia", season_number: 11)

    contestant1 = bachelorette1.contestants.create!(name: "Rob", age: 29, hometown: "Denver")
    contestant2 = bachelorette1.contestants.create!(name: "Mike", age: 34, hometown: "Greeley")
    contestant3 = bachelorette1.contestants.create!(name: "Ryan", age: 25, hometown: "Golden")
    contestant4 = bachelorette2.contestants.create!(name: "Alex", age: 40, hometown: "Frisco")

    visit bachelorette_contestants_path(bachelorette1.id)

    expect(page).to have_link(contestant1.name.to_s)

    click_link contestant1.name.to_s

    expect(current_path).to eq(bachelorette_contestant_path(:bachelorette_id, contestant1.id))
    expect(current_path).to_not eq(bachelorette_contestant_path(:bachelorette_id, contestant2.id))
  end
end
