require 'rails_helper'

RSpec.describe "shelter_pets index page", type: :feature do
  it "can see all pets for that shelter's image, name, age, sex" do
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

    visit "/shelters/#{shelter_1.id}/pets"

    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.age)
    expect(page).to have_content(pet_1.sex)
    expect(page).to have_content(pet_2.name)
    expect(page).to have_content(pet_2.age)
    expect(page).to have_content(pet_2.sex)
    expect(page).to have_xpath("//img[@src='#{pet_1.image}']")
    expect(page).to have_xpath("//img[@src='#{pet_2.image}']")
  end
end