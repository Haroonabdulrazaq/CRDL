# frozen_string_literal: true

class DepartmentForTest < ApplicationRecord
  #validations
  validates :title, presence: true, length: { in: 2..255 }
  # validates :description, presence: true, length: { in: 2..3000 }

  # associations
  belongs_to :user
  has_many :lab_tests, dependent: :destroy
end
