require 'rails_helper'

# User Story 6, Shelter Delete
#
# As a visitor
# When I visit a shelter show page
# Then I see a link to delete the shelter
# When I click the link "Delete Shelter"
# Then a 'DELETE' request is sent to '/shelters/:id',
# the shelter is deleted,
# and I am redirected to the shelter index page where I no longer see this shelter
RSpec.describe "Shelter Delete:" do
  describe "As a visitor" do
    describe "when I visit a shelter show page" do
      it "then I see a link to delete the shelter" do
        shelter = Shelter.create(
          name: 'MaxFund Dog Shelter',
          address: '1005 Galapago Street',
          city: 'Denver',
          state: 'CO',
          zip: '80204-3942'
        )
        visit("/shelters/#{shelter.id}")
        expect(page).to have_link('Delete Shelter')
      end
    end
    describe "when I click the 'Delete Shelter' link" do
      it "then a DELETE request is sent to '/shelters/:id', the shelter is deleted, and I am redirected to the shelter index page where I no longer see this shelter" do
        shelter = Shelter.create(
          name: 'MaxFund Dog Shelter',
          address: '1005 Galapago Street',
          city: 'Denver',
          state: 'CO',
          zip: '80204-3942'
        )
        visit("/shelters/#{shelter.id}")
        click_link('Delete Shelter')
        expect(current_path).to eq('/shelters')
        expect(page).to_not have_content('MaxFund Dog Shelter')
      end
    end
  end
end
