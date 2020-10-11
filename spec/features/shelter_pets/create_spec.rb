require 'rails_helper'

RSpec.describe "shelter_pets create page", type: :feature do
  it "When I visit a shelter pets index page, I see a link to create a new adoptable pet for that shelter, 'Create Pet' when I click this link, Then I am taken to '/shelters/:shelter_id/pets/new' where I can see a form to add a new adoptable pet and when I fill in the form with the pets image/name/description/age/sex a new pet is created for that shelter and I am redirected to the Shelter Pets Index page, whre I can see the new pet listed" do
   shelter_1 = Shelter.create({ name:        "Happy Shelter",
                                address:     "12345 Cherry Court",
                                city:        "San Jose",
                                state:       "California",
                                zip:         95032
                              })
      

    visit "/shelters/#{shelter_1.id}/pets"

    expect(page).to have_link("Create Pet")
    click_link ("Create Pet")
    expect(current_path).to eq("/shelters/#{shelter_1.id}/pets/new")
    
    fill_in 'image', with: 'http://cdn.akc.org/content/article-body-image/french_bulldog_puppy.jpg'
    fill_in 'name', with: 'Lucy'
    fill_in 'description', with: 'Cute lil guy'
    fill_in 'age', with: 2
    fill_in 'sex', with: 'Female'

    click_button 'Create Pet'
    
    expect(current_path).to eq("/shelters/#{shelter_1.id}/pets")

    expect(page).to have_content("Lucy")
    expect(page).to have_content(2)
    expect(page).to have_content("Female")
    expect(page).to have_xpath("//img[@src='http://cdn.akc.org/content/article-body-image/french_bulldog_puppy.jpg']")
    

  end
end