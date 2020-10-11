require 'rails_helper'

RSpec.describe "pets show page", type: :feature do
  it "can see pet with that ID including the pet's image; name; description; age; sex" do
    shelter_1 = Shelter.create(name:        "Happy Shelter",
                                address:     "12345 Cherry Court",
                                city:        "San Jose",
                                state:       "California",
                                zip:         95032)

    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_1.address)
    expect(page).to have_content(shelter_1.city)
    expect(page).to have_content(shelter_1.state)
    expect(page).to have_content(shelter_1.zip)
  end
end