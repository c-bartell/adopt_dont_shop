require 'rails_helper'

RSpec.describe Pet, type: :model do
  describe "validations:" do
    it { should validate_presence_of :image }
    it { should validate_presence_of :name }
    it { should validate_presence_of :approximate_age }
    it { should validate_presence_of :sex }
    it { should validate_presence_of :shelter_id }
  end

  describe "relationships:" do
    it { should belong_to :shelter }
  end

  describe "instance methods:" do
    it ".shelter_name" do
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
        shelter_id: shelter.id
      )
      expect(pet.shelter_name).to eq(shelter.name)
    end
  end
end
