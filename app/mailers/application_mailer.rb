# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: ENV['APP_EMAIL_ADDRESS']
  layout 'mailer'
end
