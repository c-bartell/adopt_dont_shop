require 'rails_helper'

describe "As a user" do
  describe "when I visit the site welcome page ('/')" do
    it "I see a welcome message and a link to shelters" do
      visit('/')

      expect(page).to have_content("Welcome to Adopt Don't Shop!")
      expect(page).to have_link('Shelters')
    end
  end
end
