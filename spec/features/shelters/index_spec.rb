require 'rails_helper'

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
      shelters = [shelter_1, shelter_2, shelter_3]
      visit('/shelters')
      expect(page).to have_content('Shelters')
      shelters.each do |shelter|
        expect(page).to have_content("#{shelter.name}")
      end
    end
    it "each shelter name is a link to the shelter's show page" do
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
      shelters = [shelter_1, shelter_2, shelter_3]
      shelters.each do |shelter|
        visit('/shelters')
        expect(page).to have_link("#{shelter.name}")
        click_link("#{shelter.name}")
        expect(current_path).to eq("/shelters/#{shelter.id}")
      end
    end
  end
  describe "when I visit the Shelter Index page" do
    it "then I see a link to create a new shelter ('New Shelter')" do
      visit('/shelters')
      expect(page).to have_link('New Shelter')
    end
  end
  describe "when I click 'New Shelter'" do
    it "then I am taken to '/shelters/new'" do
      visit('/shelters')
      click_link('New Shelter')
      expect(current_path).to eq('/shelters/new')
    end
  end
end
