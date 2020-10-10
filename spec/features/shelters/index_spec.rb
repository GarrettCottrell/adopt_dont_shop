require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "can see all shelter names" do
    shelter_1 = Shelters.create(name:        "Happy Shelter",
                                address:     "12345 Cherry Court",
                                city:        "San Jose",
                                state:       "California",
                                zip:         95032)
    shelter_2 = Shelters.create(name:       "Sad Shelter",
                                address:     "43892 Camino Del Cerro",
                                city:        "Los Gatos",
                                state:       "California",
                                zip:         94845)

    visit "/shelters"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_2.name)
  end
end