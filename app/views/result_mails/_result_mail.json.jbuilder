json.extract! result_mail, :id, :recipient_email, :email_object, :email_message, :user_id, :created_at, :updated_at
json.url result_mail_url(result_mail, format: :json)
