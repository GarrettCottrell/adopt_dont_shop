require 'rails_helper'

RSpec.describe "pets index update", type: :feature do
  it "When I visit the pets index page, there is a link to update every pet, 'Update Pet' and when I clik this link, I am taken to '/:id/edit where I can edit the Pet's data" do
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
    find(:xpath, '(//a[text()="Update"])[2]').click
    expect(current_path).to eq("/pets/#{pet_2.id}/edit")
    fill_in 'image', with: 'http://cdn.akc.org/content/article-body-image/french_bulldog_puppy.jpg'
    fill_in 'name', with: 'George'
    fill_in 'description', with: 'Not Cute lil guy'
    fill_in 'age', with: 2
    fill_in 'sex', with: 'Male'
    click_button 'Update Pet'

    expect(current_path).to eq("/pets/#{pet_2.id}")

    expect(page).to have_content("George")
    expect(page).to have_content(2)
    expect(page).to have_content("Male")
    expect(page).to have_xpath("//img[@src='http://cdn.akc.org/content/article-body-image/french_bulldog_puppy.jpg']")
  end
end
