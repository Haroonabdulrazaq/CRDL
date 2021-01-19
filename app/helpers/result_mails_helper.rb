module ResultMailsHelper
  def display_send_email_button result
    display = ''
    if can? :manage, ResultMail
      display = "
        <div class='column'>
          #{link_to 'Delete', sample_result_path, class: 'button is-danger is-outlined' , method: :delete , data: {confirm: 'Are you sure you want to delete this sample?'}}
        </div>
        <div class='column'>
          #{link_to 'Edit', edit_sample_result_path(result.sample.id, result), class: 'button is-link is-outlined'}		
        </div>
      "
    end 
    display.html_safe 
  end
end
