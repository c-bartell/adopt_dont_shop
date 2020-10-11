require 'rails_helper'

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
        visit("/shelters/#{@maxfund.id}/edit")
        fill_in('name', with: 'Aurora Dumb Friends League')
        fill_in('address', with: '123 Candy Cane Lane')
        fill_in('city', with: 'Aurora')
        fill_in('state', with: 'AZ')
        fill_in('zip', with: '12345')
        click_button('Update Shelter')
        visit("/shelters/#{@maxfund.id}")
        expect(page).to have_content('Aurora Dumb Friends League')
        expect(page).to_not have_content('MaxFund Dog Shelter')
        expect(page).to have_content('123 Candy Cane Lane')
        expect(page).to_not have_content('1005 Galapago Street')
        expect(page).to have_content('Aurora')
        expect(page).to_not have_content('Denver')
        expect(page).to have_content('AZ')
        expect(page).to_not have_content('CO')
        expect(page).to have_content('12345')
        expect(page).to_not have_content('80204-3942')
      end
      it "I am redirected to the shelter's show page where I see the shelter's updated info" do
        visit("/shelters/#{@maxfund.id}/edit")
        fill_in('name', with: 'Aurora Dumb Friends League')
        fill_in('address', with: '123 Candy Cane Lane')
        fill_in('city', with: 'Aurora')
        fill_in('state', with: 'AZ')
        fill_in('zip', with: '12345')
        click_button('Update Shelter')
        expect(current_path).to eq('/shelters')
        expect(page).to have_content('Aurora Dumb Friends League')
      end
    end
  end
end
