class ResultMailer < ApplicationMailer
  def new_result_email
    @result = params[:result]

    mail(to: Sample.email, subject: "You got a new result on your sample!")
  end
end
