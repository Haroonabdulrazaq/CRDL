# frozen_string_literal: true

class Price < ApplicationRecord
  has_many :samples, dependent: :destroy
end
