class ResultMailer < ApplicationMailer
  def new_result_email
    @email_params = params[:email_params]

    mail(to: @result.sample.email, subject: "You got a new email from CRDL!")
  end
end
