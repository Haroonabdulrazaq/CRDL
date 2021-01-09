class Price < ApplicationRecord
  has_many :samples, dependent: :destroy
end
