require 'rails_helper'

# User Story 2, Shelter Index
#
# As a visitor
# When I visit '/shelters'
# Then I see the name of each shelter in the system

describe "As a visitor" do
  describe "when I visit '/shelters'" do
    it "then I see the name of each shelter in the system" do
      shelter_1 = Shelter.create(
        name: 'MaxFund Dog Shelter',
        address: '1005 Galapago Street',
        city: 'Denver',
        state: 'CO',
        zip: '80204-3942'
      )
      shelter_2 = Shelter.create(
        name: 'MaxFund Cat Shelter',
        address: '720 W. 10th Avenue',
        city: 'Denver',
        state: 'CO',
        zip: '80204'
      )
      shelter_3 = Shelter.create(
        name: 'Denver Dumb Friends League',
        address: '2080 S Quebec St',
        city: 'Denver',
        state: 'CO',
        zip: '80231'
      )

      visit('/shelters')

      expect(page).to have_content('Shelters')
      expect(page).to have_content("#{shelter_1.name}")
      expect(page).to have_content("#{shelter_2.name}")
      expect(page).to have_content("#{shelter_3.name}")
    end
  end
end
