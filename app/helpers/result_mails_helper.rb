module ResultMailsHelper
  def display_send_email_button result
    display = ''
    if can? :manage, ResultMail
      display = "
        <div class='column is-3 is-pulled-right'>
          #{link_to 'Send email', new_result_mail_path, class: 'button is-primary is-outlined'}		
        </div>
      "
    end 
    display.html_safe 
  end
end
