equire 'rails_helper'

RSpec.describe "pets update page", type: :feature do
  it "As a visitor when I visit a pet show page, then i see a link to update that pet, 'Update pet' and when i click the link, I am taken to '/pets/:id/edit' where I see a form to edit the pet's data including: image/name/description/approximate age/sex" do
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
    
    expect(page).to have_link("Update Pet")
    
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.description)
    expect(page).to have_content(pet_1.age)
    expect(page).to have_content(pet_1.sex)
    expect(page).to have_content(pet_1.adoption_status)
  end
end