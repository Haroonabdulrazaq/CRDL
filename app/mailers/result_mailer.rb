class ResultMailer < ApplicationMailer
  def new_result_email
    @email_params = params[:email_params]
    @result = Result.find(@email_params[:result_id])

    mail(to: @email_params[:recipient_email], subject: @email_params[:email_object])
  end
end
