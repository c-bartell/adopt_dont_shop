require 'rails_helper'

# User Story 8, Shelter Pets Index
#
# As a visitor
# When I visit '/shelters/:shelter_id/pets'
# Then I see each Pet that can be adopted from that Shelter with that shelter_id including the Pet's:
# - image
# - name
# - approximate age
# - sex

RSpec.describe "Shelter Pets Index:" do
  describe "As a visitor" do
    describe "when I visit '/shelters/:shelter_id/pets'" do
      describe "then I see each Pet that can be adopted from that Shelter with that shelter_idincluding the pet's:" do
        before(:all) do
          @shelter_1 = Shelter.create!(
            name: 'MaxFund Dog Shelter',
            address: '1005 Galapago Street',
            city: 'Denver',
            state: 'CO',
            zip: '80204-3942'
          )
          @shelter_2 = Shelter.create!(
            name: 'MaxFund Cat Shelter',
            address: '720 W. 10th Avenue',
            city: 'Denver',
            state: 'CO',
            zip: '80204'
          )
          @shelters = [@shelter_1, @shelter_2]
          @pet_1 = Pet.create!(
            image: 'https://cdn.pixabay.com/photo/2016/02/19/11/53/pug-1210025_960_720.jpg',
            name: 'Admiral Muffins, III',
            approximate_age: '2',
            sex: 'M',
            shelter_id: @shelter_1.id
          )
          @pet_2 = Pet.create!(
            image: 'https://cdn.pixabay.com/photo/2017/01/30/23/19/cat-2022341_960_720.jpg',
            name: 'Commodore Poptart, Esq.',
            approximate_age: '6',
            sex: 'F',
            shelter_id: @shelter_2.id
          )
          @pet_3 = Pet.create!(
            image: 'https://cdn.pixabay.com/photo/2017/11/15/13/52/bulldog-2952049_960_720.jpg',
            name: 'Banjo, Dutchess of Snortleshire',
            approximate_age: '3',
            sex: 'F',
            shelter_id: @shelter_1.id
          )
          @pets = [@pet_1, @pet_2, @pet_3]
        end
        after(:all) do
          @pets.each do |pet|
            pet.destroy
          end
          @shelters.each do |shelter|
            shelter.destroy
          end
        end
        it "image" do
          @shelters.each do |shelter|
            visit("/shelters/#{shelter.id}/pets")
            expect(page).to have_content(shelter.name)
            @pets.each do |pet|
              if pet.shelter_id == shelter.id
                expect(page).to have_xpath("//img[@src='#{pet.image}']")
              else
                expect(page).to_not have_xpath("//img[@src='#{pet.image}']")
              end
            end
          end
        end
        it "name" do
          @shelters.each do |shelter|
            visit("/shelters/#{shelter.id}/pets")
            @pets.each do |pet|
              if pet.shelter_id == shelter.id
                expect(page).to have_content("#{pet.name}")
              else
                expect(page).to_not have_content("#{pet.name}")
              end
            end
          end
        end
        it "approximate age" do
          @shelters.each do |shelter|
            visit("/shelters/#{shelter.id}/pets")
            @pets.each do |pet|
              if pet.shelter_id == shelter.id
                expect(page).to have_content("Approximate Age: #{pet.approximate_age}")
              else
                expect(page).to_not have_content("Approximate Age: #{pet.approximate_age}")
              end
            end
          end
        end
        it "sex" do
          #code
        end
      end
    end
  end
end
