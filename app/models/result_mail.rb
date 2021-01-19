class ResultMail < ApplicationRecord
  #validations
  validates :recipient_email, presence: true, length: { in: 3..50 }, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/
  validates :email_object, presence: true, length: { in: 3..150 }
  validates :email_message, presence: true, length: { in: 3..5000 }

  #associations
  belongs_to :user
end
