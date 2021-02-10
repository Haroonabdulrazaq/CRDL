# frozen_string_literal: true

class Result < ApplicationRecord
  belongs_to :sample
  has_many :result_mails, dependent: :destroy
end
