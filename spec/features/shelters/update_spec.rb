require 'rails_helper'

RSpec.describe "shelters update page", type: :feature do
  it "When I visit the shelter show page, ther is a link to update the shelter, 'Update Shelter' and when I clik this link, I am taken to '/shelters/:id/edit where I can edit the Shelter's data" do
    shelter_1 = Shelter.create(name:        "Happy Shelter",
                                address:     "12345 Cherry Court",
                                city:        "San Jose",
                                state:       "California",
                                zip:         95032)

    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_link("Update Shelter")
    click_link "Update Shelter"
    expect(current_path).to eq("/shelters/#{shelter_1.id}/edit")
    
    fill_in 'shelters[name]', with: 'Happy Shelter'
    fill_in 'shelters[address]', with: '1234'
    fill_in 'shelters[city]', with: 'San Jose'
    fill_in 'shelters[state]', with: 'California'
    fill_in 'shelters[zip]', with: 34925
    click_button 'Submit'
    
    expect(current_path).to eq("/shelters/#{shelter_1.id}")
    expect(page).to have_content("Happy Shelter")
    expect(page).to have_content("1234")
    expect(page).to have_content("San Jose")
    expect(page).to have_content("California")
    expect(page).to have_content(34925)
  end
end