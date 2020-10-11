require 'rails_helper'

RSpec.describe "pets index delete", type: :feature do
  it "When I visit the pets index page, there is a link to delete next to each pet, 'Delete' and when I clik this link, I am returned to Pets index page where I no longer see that pet" do
    shelter_1 = Shelter.create({name:        "Test Shelter1",
                                address:     "12345 Cherry Court",
                                city:        "San Jose",
                                state:       "California",
                                zip:         95032})
    pet_1 = Pet.create({       image:        "http://cdn.akc.org/content/hero/puppy_pictures_header.jpg",
                                name:         "Test Pet",
                                age:           2,
                                sex:          "Male",
                                shelter_id:   shelter_1.id
                                })
    pet_2 = Pet.create({       image:        "http://cdn.akc.org/content/article-body-image/dalmatian_puppy_1.jpg",
                                name:         "Sassy",
                                age:           4,
                                sex:          "Female",
                                shelter_id:    shelter_1.id })

    visit "/pets"
    find(:xpath, '(//a[text()="Delete"])[2]').click
    expect(current_path).to eq("/pets")
    
    expect(page).to_not have_content("Sassy")
    end
end