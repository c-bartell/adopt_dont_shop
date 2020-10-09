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
    it "I see a form for a new shelter with" do
      visit('/shelters/new')

      expect(page).to have_content('Add New Shelter')
      expect(page).to have_field('Name:', type: 'text')
      expect(page).to have_field('Address', type: 'text')
      expect(page).to have_field('City:', type: 'text')
      expect(page).to have_field('State:', type: 'text')
      expect(page).to have_field('Zip:', type: 'text')
      expect(page).to have_field('submit_new_shelter', type: 'submit')
    end
    # describe "when I fill out the form with a new shelter's name, address, city, state, and zip and I click the button" do
    # 
    # end
  end
end
