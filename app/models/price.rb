class Price < ApplicationRecord
  belongs_to :sample
  serialize :lab_tests, Hash
end
