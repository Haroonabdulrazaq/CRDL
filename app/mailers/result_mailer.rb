class ResultMailer < ApplicationMailer
  def new_result_email
    @email_params = params[:email_params]
    @result = Result.find(@email_params[:result_id])

    mail(to: @email_params[:recipient_email], subject: "You got a new email from CRDL related to result # #{@result.id} for sample: #{@result.sample.name}!")
  end
end
