require 'rails_helper'

# User Story 4, Shelter Creation
#
# As a visitor
# (shelter/index spec) When I visit the Shelter Index page
# Then I see a link to create a new Shelter, "New Shelter"
# When I click this link
# Then I am taken to '/shelters/new'
# (shelter/new spec) where I  see a form for a new shelter
# When I fill out the form with a new shelter's:
# - name
# - address
# - city
# - state
# - zip
# And I click the button "Create Shelter" to submit the form
# Then a `POST` request is sent to '/shelters',
# a new shelter is created,
# and I am redirected to the Shelter Index page where I see the new Shelter listed.

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
    # describe "when I fill out the form with a new shelter's name, address, city, state, and zip and I click the button" do
    #
    # end
  end
end
