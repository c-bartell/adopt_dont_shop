require 'rails_helper'

RSpec.describe Pet, type: :model do
  describe "validations" do
    it { should_validate_presence_of :image }
    it { should_validate_presence_of :name }
    it { should_validate_presence_of :approximate_age }
    it { should_validate_presence_of :sex }
    it { should_validate_presence_of :shelter_id }
  end

  describe "relationships" do
    it { should_belong_to :shelter }
  end
end
