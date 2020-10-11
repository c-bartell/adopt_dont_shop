class Pet < ApplicationRecord
  # Validations
  validates_presence_of :image
  validates_presence_of :name
  validates_presence_of :approximate_age
  validates_presence_of :sex
  validates_presence_of :shelter_id

  # Relationships
end
