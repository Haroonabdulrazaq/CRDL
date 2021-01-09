class Currency < ApplicationRecord
  has_many :samples, dependent: :destroy
end
