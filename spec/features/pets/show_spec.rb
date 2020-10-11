require 'rails_helper'

RSpec.describe "Pet Show:" do
  describe "As a visitor:" do
    describe "when I visit '/pets/:id'" do
      describe "then I see the pet with that id including the pet's:" do
        it "image" do
          shelter = Shelter.create!(
            name: 'MaxFund Dog Shelter',
            address: '1005 Galapago Street',
            city: 'Denver',
            state: 'CO',
            zip: '80204-3942'
          )
          pet = Pet.create!(
            image: 'https://cdn.pixabay.com/photo/2016/02/19/11/53/pug-1210025_960_720.jpg',
            name: 'Admiral Muffins, III',
            approximate_age: '2',
            sex: 'M',
            shelter_id: shelter.id,
            description: 'A pug in a rug.',
            adoption_status: 'adoptable'
          )
          visit("/pets/#{pet.id}")
          expect(page).to have_xpath("//img[@src='#{pet.image}']")
        end
        it "name" do
          shelter = Shelter.create!(
            name: 'MaxFund Dog Shelter',
            address: '1005 Galapago Street',
            city: 'Denver',
            state: 'CO',
            zip: '80204-3942'
          )
          pet = Pet.create!(
            image: 'https://cdn.pixabay.com/photo/2016/02/19/11/53/pug-1210025_960_720.jpg',
            name: 'Admiral Muffins, III',
            approximate_age: '2',
            sex: 'M',
            shelter_id: shelter.id,
            description: 'A pug in a rug.',
            adoption_status: 'adoptable'
          )
          visit("/pets/#{pet.id}")
          expect(page).to have_content("#{pet.name}")
        end
        it "description" do
          shelter = Shelter.create!(
            name: 'MaxFund Dog Shelter',
            address: '1005 Galapago Street',
            city: 'Denver',
            state: 'CO',
            zip: '80204-3942'
          )
          pet = Pet.create!(
            image: 'https://cdn.pixabay.com/photo/2016/02/19/11/53/pug-1210025_960_720.jpg',
            name: 'Admiral Muffins, III',
            approximate_age: '2',
            sex: 'M',
            shelter_id: shelter.id,
            description: 'A pug in a rug.',
            adoption_status: 'adoptable'
          )
          visit("/pets/#{pet.id}")
          expect(page).to have_content("Description: #{pet.description}")
        end
        it "approximate age" do
          shelter = Shelter.create!(
            name: 'MaxFund Dog Shelter',
            address: '1005 Galapago Street',
            city: 'Denver',
            state: 'CO',
            zip: '80204-3942'
          )
          pet = Pet.create!(
            image: 'https://cdn.pixabay.com/photo/2016/02/19/11/53/pug-1210025_960_720.jpg',
            name: 'Admiral Muffins, III',
            approximate_age: '2',
            sex: 'M',
            shelter_id: shelter.id,
            description: 'A pug in a rug.',
            adoption_status: 'adoptable'
          )
          visit("/pets/#{pet.id}")
          expect(page).to have_content("Approximate Age: #{pet.approximate_age}")
        end
        it "sex" do
          shelter = Shelter.create!(
            name: 'MaxFund Dog Shelter',
            address: '1005 Galapago Street',
            city: 'Denver',
            state: 'CO',
            zip: '80204-3942'
          )
          pet = Pet.create!(
            image: 'https://cdn.pixabay.com/photo/2016/02/19/11/53/pug-1210025_960_720.jpg',
            name: 'Admiral Muffins, III',
            approximate_age: '2',
            sex: 'M',
            shelter_id: shelter.id,
            description: 'A pug in a rug.',
            adoption_status: 'adoptable'
          )
          visit("/pets/#{pet.id}")
          expect(page).to have_content("Sex: #{pet.sex}")
        end
        it "adoptable/pending adoption status" do
          shelter = Shelter.create!(
            name: 'MaxFund Dog Shelter',
            address: '1005 Galapago Street',
            city: 'Denver',
            state: 'CO',
            zip: '80204-3942'
          )
          pet = Pet.create!(
            image: 'https://cdn.pixabay.com/photo/2016/02/19/11/53/pug-1210025_960_720.jpg',
            name: 'Admiral Muffins, III',
            approximate_age: '2',
            sex: 'M',
            shelter_id: shelter.id,
            description: 'A pug in a rug.',
            adoption_status: 'adoptable'
          )
          visit("/pets/#{pet.id}")
          expect(page).to have_content("Adoption Status: #{pet.adoption_status}")
        end
        # end
      end
    end
  end
end
