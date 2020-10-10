require 'rails_helper'

# User Story 5, Shelter Update
#
# As a visitor
# When I visit a shelter show page
# Then I see a link to update the shelter "Update Shelter"
# When I click the link "Update Shelter"
# Then I am taken to '/shelters/:id/edit' where I  see a form to edit the shelter's data including:
# - name
# - address
# - city
# - state
# - zip
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/shelters/:id',
# the shelter's info is updated,
# and I am redirected to the Shelter's Show page where I see the shelter's updated info

RSpec.describe "Shelter Update:" do
  describe "As a visitor" do
    before(:all) do
      @maxfund = Shelter.create(
        name: 'MaxFund Dog Shelter',
        address: '1005 Galapago Street',
        city: 'Denver',
        state: 'CO',
        zip: '80204-3942'
      )
    end
    after(:all) do
      @maxfund.destroy
    end
    describe "when I visit a shelter show page" do
      it "then I see a link to update the shelter 'Update Shelter'" do
        visit("/shelters/#{@maxfund.id}")
        expect(page).to have_link('Update Shelter')
      end
    end
    describe "when I click the link 'Update Shelter'" do
      it "then I am taken to '/shelters/:id/edit'" do
        visit("/shelters/#{@maxfund.id}")
        click_link('Update Shelter')
        expect(current_path).to eq("/shelters/#{@maxfund.id}/edit")
      end
      describe "I see a form to edit the shelter's data including:" do
        it "name," do
          visit("/shelters/#{@maxfund.id}/edit")
          expect(page).to have_field('name', type: 'text', with: @maxfund.name)
        end
        it "address," do
          visit("/shelters/#{@maxfund.id}/edit")
          expect(page).to have_field('address', type: 'text', with: @maxfund.address)
        end
        it "city," do
          visit("/shelters/#{@maxfund.id}/edit")
          expect(page).to have_field('city', type: 'text', with: @maxfund.city)
        end
        it "state," do
          visit("/shelters/#{@maxfund.id}/edit")
          expect(page).to have_field('state', type: 'text', with: @maxfund.state)
        end
        it "zip," do
          visit("/shelters/#{@maxfund.id}/edit")
          expect(page).to have_field('zip', type: 'text', with: @maxfund.zip)
        end
        it "a submit button" do
          visit("/shelters/#{@maxfund.id}/edit")
          expect(page).to have_button('Update Shelter', type: 'submit')
        end
      end
    end
    describe "when I fill out the form with updated information and I click submit" do
      it "then a PATCH request is sent to '/shelters/:id', the shelters info is updated," do
        #expectations
      end
      it "I am redirected to the shelter's show page where I see the shelter's updated info" do
        #expectations
      end
    end
  end
end

#alternative
# RSpec.describe "Shelter Update:" do
#   describe "As a visitor" do
#     before(:all) do
#       @maxfund = Shelter.create(
#         name: 'MaxFund Dog Shelter',
#         address: '1005 Galapago Street',
#         city: 'Denver',
#         state: 'CO',
#         zip: '80204-3942'
#       )
#       visit("/shelters/#{@maxfund.id}")
#     end
#     describe "when I visit a shelter show page" do
#       it "then I see a link to update the shelter 'Update Shelter'" do
#         #expectations
#       end
#     end
#     describe "When I click the link 'Update Shelter'" do
#       it "Then I am taken to '/shelters/:id/edit' where I  see a form to edit the shelter's data including: name, address, city, state, zip, and a submit button" do
#         #expectations
#       end
#     end
#     describe "When I fill out the form with updated information
#     And I click the button to submit the form" do
#       it "Then a `PATCH` request is sent to '/shelters/:id',
#       the shelter's info is updated,
#       and I am redirected to the Shelter's Show page where I see the shelter's updated info" do
#         #expectations
#       end
#     end
#   end
# end
