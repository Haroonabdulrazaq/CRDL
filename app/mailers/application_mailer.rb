# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'descholar.stech@gmail.com'
  layout 'mailer'
end
