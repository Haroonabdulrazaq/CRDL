class Sample < ApplicationRecord
    has_many :results, dependent: :destroy
end
