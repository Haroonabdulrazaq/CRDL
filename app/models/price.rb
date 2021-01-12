class Price < ApplicationRecord
  #Validations
  validates :lab_tests, presence: true

  #Associations
  belongs_to :sample
  serialize :lab_tests
end
