require 'rails_helper'

describe "As a user" do
  describe "when I visit the site welcome page ('/')" do
    it "I see a welcome message and a link to shelters" do
      visit('/')

      expect(page).to have_content("Welcome to Adopt Don't Shop!")
      expect(page).to have_link('Shelters')
    end
  end
  describe "when I click on the 'Shelters' link" do
    it "I am taken to '/shelters'" do
      visit('/')
      
      click_link('Shelters')
      expect(current_path).to eq('/shelters')
    end
  end
end
