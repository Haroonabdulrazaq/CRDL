class ResultMailer < ApplicationMailer
  def new_result_email
    @email_params = params[:email_params]

    mail(to: @email_params.recipient_email, subject: "You got a new email from CRDL related to #{link_to 'this result', sample_result_url(email_params.result.sample_id, email_params.result)}!")
  end
end
