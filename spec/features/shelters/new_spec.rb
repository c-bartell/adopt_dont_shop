require 'rails_helper'

describe "As a visitor" do
  describe "when I visit '/shelters/new'" do
    it "I see a form for a new shelter with a title and name, address, city, state, zip, and submit fields" do
      visit('/shelters/new')
      expect(page).to have_content('Add New Shelter')
      expect(page).to have_field('name_new_shelter', type: 'text')
      expect(page).to have_field('address_new_shelter', type: 'text')
      expect(page).to have_field('city_new_shelter', type: 'text')
      expect(page).to have_field('state_new_shelter', type: 'text')
      expect(page).to have_field('zip_new_shelter', type: 'text')
      expect(page).to have_button('Create Shelter', type: 'submit')
    end
  end
end
