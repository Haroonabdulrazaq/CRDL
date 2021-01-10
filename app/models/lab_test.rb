# frozen_string_literal: true

class LabTest < ApplicationRecord
  belongs_to :user
  belongs_to :department_for_test
end
