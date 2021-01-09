# frozen_string_literal: true

class Sample < ApplicationRecord
  has_many :results, dependent: :destroy
  belongs_to :currency
  belongs_to :price

  def self.search_by(search_term)
    where('LOWER(name) LIKE :search_term',
          search_term: "%#{search_term.downcase}%")
  end
end
