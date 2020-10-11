require 'rails_helper'

RSpec.describe "pets show page", type: :feature do
  it "can see pet with that ID including the pet's image; name; description; age; sex, adoption status" do
    shelter_1 = Shelter.create({name:        "Happy Shelter",
                                address:     "12345 Cherry Court",
                                city:        "San Jose",
                                state:       "California",
                                zip:         95032})

    pet_1 = Pet.create( {      image:        "http://cdn.akc.org/content/hero/puppy_pictures_header.jpg",
                                name:         "Joey",
                                age:           2,
                                sex:          "Male",
                                shelter_id:   shelter_1.id,
                                description:  "Cute little guy",
                                adoption_status: "adoptable"
                                })

    visit "/pets/#{pet_1.id}"
    
    expect(page).to have_xpath("//img[@src='#{pet_1.image}']")
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.description)
    expect(page).to have_content(pet_1.age)
    expect(page).to have_content(pet_1.sex)
    expect(page).to have_content(pet_1.adoption_status)
  end
end