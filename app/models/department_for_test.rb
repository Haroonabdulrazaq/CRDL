# frozen_string_literal: true

class DepartmentForTest < ApplicationRecord
  belongs_to :user
  has_many :lab_tests, dependent: :destroy
end
