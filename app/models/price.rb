class Price < ApplicationRecord
  belongs_to :sample
  belongs_to :lab_test
end
