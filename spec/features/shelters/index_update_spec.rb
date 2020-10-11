require 'rails_helper'

RSpec.describe "shelters index update", type: :feature do
  it "When I visit the shelter index page, there is a link to update every shelter, 'Update Shelter' and when I clik this link, I am taken to '/shelters/:id/edit where I can edit the Shelter's data" do
    shelter_1 = Shelter.create(name:        "Happy Shelter",
                                address:     "12345 Cherry Court",
                                city:        "San Jose",
                                state:       "California",
                                zip:         95032)
    shelter_2 = Shelter.create(name:       "Sad Shelter",
                                address:     "43892 Camino Del Cerro",
                                city:        "Los Gatos",
                                state:       "California",
                                zip:         94845)

    visit "/shelters"
    find(:xpath, '(//a[text()="Update"])[2]').click
    expect(current_path).to eq("/shelters/#{shelter_2.id}/edit")
    
    fill_in 'shelters[name]', with: 'Test_Shelter'
    fill_in 'shelters[address]', with: '2352523'
    fill_in 'shelters[city]', with: 'test_city'
    fill_in 'shelters[state]', with: 'test_state'
    fill_in 'shelters[zip]', with: 3225235
    click_button 'Submit'
    
    expect(current_path).to eq("/shelters/#{shelter_2.id}")
    expect(page).to have_content("Test_Shelter")
    expect(page).to have_content("2352523")
    expect(page).to have_content("test_city")
    expect(page).to have_content("test_state")
    expect(page).to have_content(3225235)
    end
end