require 'rails_helper'

RSpec.describe "pets index page", type: :feature do
  it "can see all pet information, including image, name, age, sex, shelter" do
    
    shelter_1 = Shelter.create!({name:        "Happy Shelter",
                                address:     "12345 Cherry Court",
                                city:        "San Jose",
                                state:       "California",
                                zip:         95032})

    pet_1 = Pet.create!( {      image:        "http://cdn.akc.org/content/hero/puppy_pictures_header.jpg",
                                name:         "Joey",
                                age:           2,
                                sex:          "Male",
                                shelter_id:   shelter_1.id
                                })
    pet_2 = Pet.create!({       image:        "http://cdn.akc.org/content/article-body-image/dalmatian_puppy_1.jpg",
                                name:         "Sassy",
                                age:           4,
                                sex:          "Female",
                                shelter_id:    shelter_1.id })

    visit "/pets"

    expect(page).to have_link(pet_1.name)
    expect(page).to have_content(pet_1.age)
    expect(page).to have_content(pet_1.sex)
    expect(page).to have_content(pet_1.shelter.name)
    expect(page).to have_content(pet_2.age)
    expect(page).to have_content(pet_2.sex)
    expect(page).to have_content(pet_2.name)
    expect(page).to have_content(pet_2.name)
  end
end
