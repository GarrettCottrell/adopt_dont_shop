require 'rails_helper'

RSpec.describe "pets delete page", type: :feature do
  it "When I visit a pet show page, there is a link to delete the pet, 'delete' and when I click this link, the pet is deleted and I am redirected to the pet index page" do
    shelter_1 = Shelter.create({name:        "Test Shelter",
                                address:     "12345 Cherry Court",
                                city:        "San Jose",
                                state:       "California",
                                zip:         95032})

    pet_1 = Pet.create({        image:        "http://cdn.akc.org/content/hero/puppy_pictures_header.jpg",
                                name:         "Test Pet",
                                age:           2,
                                sex:          "Male",
                                shelter_id:   shelter_1.id
                                })

    visit "/pets/#{pet_1.id}"

    expect(page).to have_button("delete")
    click_on "delete"
    expect(current_path).to eq("/pets")
    
    expect(current_path).to eq("/pets")
    expect(page).to_not have_content("Test Pet")
  end
end