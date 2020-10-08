require 'rails_helper'

# User Story 3, Shelter Show
#
# As a visitor
# When I visit '/shelters/:id'
# Then I see the shelter with that id including the shelter's:
# - name
# - address
# - city
# - state
# - zip

describe "As a visitor" do
  describe "when I visit '/shelters/:id'" do
    describe "then I see the shelter with that id including the shelter's:" do
      shelter = Shelter.create(
        name: 'MaxFund Dog Shelter',
        address: '1005 Galapago Street',
        city: 'Denver',
        state: 'CO',
        zip: '80204-3942'
      )
      it "name" do
        visit("/shelters/#{shelter.id}")
        expect(page).to have_content("Name: #{shelter.name}")
      end
      it "address" do
        visit("/shelters/#{shelter.id}")
        expect(page).to have_content("Address: #{shelter.address}")
      end
      it "city" do
        visit("/shelters/#{shelter.id}")
        expect(page).to have_content("City: #{shelter.city}")
      end
      it "state" do
        visit("/shelters/#{shelter.id}")
        expect(page).to have_content("State: #{shelter.state}")
      end
      it "zip" do
        visit("/shelters/#{shelter.id}")
        expect(page).to have_content("Zip: #{shelter.zip}")
      end
    end
  end
end
