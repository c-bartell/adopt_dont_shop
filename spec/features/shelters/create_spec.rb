require 'rails_helper'

describe 'As a visitor' do
  describe 'when I fill out the New Shelter form with name, address, city, state, and zip and I click the Create Shelter button' do
    it "then a POST request is sent to '/shelters', an new shelter is created, and I am resirected to the Shelter Index Page where I see the new Shelter listed" do
      visit('/shelters/new')
      fill_in('name_new_shelter', with: 'MaxFund Dog Shelter')
      fill_in('address_new_shelter', with: '1005 Galapago Street')
      fill_in('city_new_shelter', with: 'Denver')
      fill_in('state_new_shelter', with: 'CO')
      fill_in('zip_new_shelter', with: '80204-3942')

      save_and_open_page
    end
  end
end

# name: 'MaxFund Dog Shelter',
# address: '1005 Galapago Street',
# city: 'Denver',
# state: 'CO',
# zip: '80204-3942'
