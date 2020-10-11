require 'rails_helper'

# User Story 9, Pet Show
#
# As a visitor
# When I visit '/pets/:id'
# Then I see the pet with that id including the pet's:
# - image
# - name
# - description
# - approximate age
# - sex
# - adoptable/pending adoption status

RSpec.describe "Pet Show:" do
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
      name: 'Banjo, Dutchess of Snortleshire',
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
  describe "As a visitor:" do
    describe "when I visit '/pets/:id'" do
        describe "then I see the pet with that id including the pet's:" do
          it "image" do
            #code
          end
          it "name" do
            #code
          end
          it "description" do
            #code
          end
          it "approximate age" do
            #code
          end
          it "sex" do
            #code
          end
          it "adoptable/pending adoption status" do
            #code
          end
        end
    end
  end
end
