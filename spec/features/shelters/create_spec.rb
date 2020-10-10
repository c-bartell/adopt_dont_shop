require 'rails_helper'

describe 'As a visitor' do
  describe 'when I fill out the New Shelter form with name, address, city, state, and zip and I click the Create Shelter button' do
    it "then a POST request is sent to '/shelters', a new shelter is created, and I am redirected to the Shelter Index Page where I see the new Shelter listed" do
      visit('/shelters/new')
      fill_in('name_new_shelter', with: 'MaxFund Dog Shelter')
      fill_in('address_new_shelter', with: '1005 Galapago Street')
      fill_in('city_new_shelter', with: 'Denver')
      fill_in('state_new_shelter', with: 'CO')
      fill_in('zip_new_shelter', with: '80204-3942')
      click_button('Create Shelter')
      expect(current_path).to eq('/shelters')
      expect(page).to have_content('MaxFund Dog Shelter')
      expect(page).to have_content('1005 Galapago Street')
      expect(page).to have_content('Denver')
      expect(page).to have_content('CO')
      expect(page).to have_content('80204-3942')
    end
  end
end
