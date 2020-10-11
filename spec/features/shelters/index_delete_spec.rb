require 'rails_helper'

RSpec.describe "shelters index delete", type: :feature do
  it "When I visit the shelter index page, there is a link to delete next to each shelter, 'Delete' and when I clik this link, I am returned to Shelters index page where I no longer see that shelter" do
    shelter_1 = Shelter.create(name:        "Test Shelter1",
                                address:     "12345 Cherry Court",
                                city:        "San Jose",
                                state:       "California",
                                zip:         95032)
    shelter_2 = Shelter.create(name:       "Test Shelter2",
                                address:     "43892 Camino Del Cerro",
                                city:        "Los Gatos",
                                state:       "California",
                                zip:         94845)

    visit "/shelters"
    find(:xpath, '(//a[text()="Delete"])[2]').click
    expect(current_path).to eq("/shelters")
    
    expect(page).to_not have_content("Test Shelter2")
    end
end