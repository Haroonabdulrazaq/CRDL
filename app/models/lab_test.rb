# frozen_string_literal: true

class LabTest < ApplicationRecord
  # validations
  validates :title, presence: true, length: { in: 2..255 }
  validates :description, presence: true, length: { in: 2..3000 }
  validates :quantity, presence: true, numericality: true
  validates :price_per_unit, presence: true, numericality: true

  # associations
  belongs_to :user
  belongs_to :department_for_test
end
