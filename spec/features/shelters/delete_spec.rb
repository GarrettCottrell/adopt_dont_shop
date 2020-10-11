require 'rails_helper'

RSpec.describe "shelters update page", type: :feature do
  it "When I visit a shelter show page, there is a link to delete the shelter, 'delete' and when I click this link, the shelter is deleted and I am redirected to the shelter index page" do
    shelter_1 = Shelter.create(name:        "Sad Shelter",
                                address:     "12345 Cherry Court",
                                city:        "San Jose",
                                state:       "California",
                                zip:         95032)

    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_button("delete")
    click_on "delete"
    expect(current_path).to eq("/shelters")
    
    expect(current_path).to eq("/shelters")
    expect(page).to_not have_content("Sad Shelter")
  end
end