require 'rails_helper'

# User Story 7, Pet Index
#
# As a visitor
# When I visit '/pets'
# Then I see each Pet in the system including the Pet's:
# - image
# - name
# - approximate age
# - sex
# - name of the shelter where the pet is currently located
#
# NOTE: Images should be stored as a string as the url pointing to an externally hosted image, for example: "https://dogtime.com/assets/uploads/2018/10/puppies-cover.jpg"

RSpec.describe "Pets Index:" do
  describe "As a visitor" do
    describe "when I visit '/pets'" do
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
        @shelter_3 = Shelter.create!(
          name: 'Denver Dumb Friends League',
          address: '2080 S Quebec St',
          city: 'Denver',
          state: 'CO',
          zip: '80231'
        )
        @shelters = [@shelter_1, @shelter_2, @shelter_3]
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
          name: 'Banjo, Duke of Snortleshire',
          approximate_age: '3',
          sex: 'F',
          shelter_id: @shelter_3.id
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
      describe "then I see each Pet in the system, including the Pet's" do
        it "image" do
          visit('/pets')
          @pets.each do |pet|
            expect(page).to have_xpath("//img[@src='#{pet.image}']")
          end
        end
        it "name" do
          visit('/pets')
          @pets.each do
            expect(page).to have_content("#{pet.name}")
          end
        end
        it "approximate age" do
          visit('/pets')
          @pets.each do
            expect(page).to have_content("#{pet.approximate_age}")
          end
        end
        it "sex" do
          visit('/pets')
          @pets.each do
            expect(page).to have_content("#{pet.sex}")
          end
        end
        it "name of the shelter where the pet is currently located" do
          visit('/pets')
          @pets.each do
            shelter_name = Shelter.find(pet.shelter_id).name
            expect(page).to have_content("#{shelter_name}")
          end
        end
      end
    end
  end
end
#12x9
