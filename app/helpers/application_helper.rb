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
        #{if can? :manage, Sample
            link_to new_sample_path, class: 'button is-primary' do
              "<span class='icon'>
                <i class='fa fa-plus-circle is-3' arial-hidden='true'></i>
                </span>
                <span>New Sample</span>".html_safe
            end
          end}
          </span>
      <span class='navbar-item'>#{link_to 'Logout', destroy_user_session_path, method: :delete,
                                                                               class: 'button is-danger'}</span>
      "
              else
                "
        #{link_to 'Register', new_user_registration_path, class: 'navbar-item'}
        #{link_to 'Login', new_user_session_path, class: 'navbar-item'}
      "
              end
    display.html_safe
  end
end
