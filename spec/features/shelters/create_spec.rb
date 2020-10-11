require 'rails_helper'

RSpec.describe "shelters create page", type: :feature do
  it "When I visit shelter index page, I see a link to create a new shelter, 'New Shelter' when I click this link, Then I am taken to '/shelters/new'" do
    shelter_1 = Shelter.create(name:        "Happy Shelter",
                                address:     "12345 Cherry Court",
                                city:        "San Jose",
                                state:       "California",
                                zip:         95032)

    visit "/shelters"

    expect(page).to have_link("New Shelter")
    click_link "New Shelter"
    expect(current_path).to eq('/shelters/new')
    
    fill_in 'shelters[name]', with: 'Grumpy Shelter'
    fill_in 'shelters[address]', with: '1234 Cherry Lane'
    fill_in 'shelters[city]', with: 'San Jose'
    fill_in 'shelters[state]', with: 'California'
    fill_in 'shelters[zip]', with: 34925
    click_on 'Create Shelter'
    
    expect(current_path).to eq("/shelters")
    expect(page).to have_content("Grumpy Shelter")
  end
end