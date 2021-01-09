# frozen_string_literal: true

module ApplicationHelper
  def display_user_signup_login_or_create_sample
    display = ''
    display = if user_signed_in?
      "
      <span class='navbar-item'>#{
        link_to 'Dashboard', rails_admin_path, class: 'button is-primary is-outlined' if can? :manage, :rails_admin
        }</span>
      <span class='navbar-item'>              
        #{link_to new_sample_path, class: 'button is-primary' do
            "<span class='icon'>
              <i class='fa fa-plus-circle is-3' arial-hidden='true'></i>
              </span>
              <span>New Sample</span>".html_safe
            end}      
          </span>
      <span class='navbar-item'>#{link_to 'Logout', destroy_user_session_path, method: :delete, class: 'button is-danger'}</span>
      "
    else
      "
        #{link_to 'Register', new_user_registration_path, class: 'navbar-item'}
        #{link_to 'Login', new_user_session_path, class: 'navbar-item'}
      "
    end
    display.html_safe
  end

  def display_create_result_button sample
    display = ''
    if can? :manage, Result
      display = "
      <nav class='navbar is-pulled-right'>
        <div class='navbar-menu '>
          <div class='navbar-item'>
            <div class='field is-grouped '>
              <p class='control '>
                #{link_to 'Create Result', new_sample_result_path(sample), class: 'button is-dark'}
              </p>
          </div>
        </div>
      </nav>
      "
    end
    display.html_safe
  end

  def display_sample_control_buttons sample
    display = ''
    if can? :manage, Sample
      display = "
        <div class='column'>
          #{link_to 'Delete', sample_path, class: 'button is-danger is-outlined' , method: :delete , data: {confirm: 'Are you sure you want to delete this sample?'}}
        </div>
        <div class='column'>
          #{link_to 'Edit', edit_sample_path(sample), class: 'button is-link is-outlined'}		
        </div>
      "
    end 
    display.html_safe   
  end

end
