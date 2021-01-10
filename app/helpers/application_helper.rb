# frozen_string_literal: true

module ApplicationHelper
  def display_user_signup_login_or_create_sample
    display = ''
    display = if user_signed_in?
                "
      <span class='navbar-item'>#{
        link_to 'Dashboard', rails_admin_path, class: 'button is-primary is-outlined' if can? :manage, :rails_admin
      }</span>
      #{ if can? :manage, Sample and can? :manage, LabTest and can? :manage, DepartmentForTest
        "<div class='navbar-item dropdown'>
        <div class='dropdown-trigger'>
          <button class='button' aria-haspopup='true' aria-controls='dropdown-menu3'>
            <span>Options for sample & test</span>
            <span class='icon is-small'>
              <i class='fa fa-angle-down' aria-hidden='true'></i>
            </span>
          </button>
        </div>
        <div class='dropdown-menu' id='dropdown-menu3' role='menu'>
          <div class='dropdown-content'>
            <span class='dropdown-item'>
            #{link_to new_sample_path do
                  "<span class='icon'>
                    <i class='fa fa-plus-circle is-3' arial-hidden='true'></i>
                    </span>
                    <span>New Sample</span>".html_safe
                end}
              </span>
              <span class='dropdown-item'>
              #{link_to new_lab_test_path do
                    "<span class='icon'>
                      <i class='fa fa-plus-circle is-3' arial-hidden='true'></i>
                      </span>
                      <span>New Lab test & price</span>".html_safe
                  end}
              </span>
              <span class='dropdown-item'>
              #{link_to new_department_for_test_path do
                "<span class='icon'>
                  <i class='fa fa-plus-circle is-3' arial-hidden='true'></i>
                  </span>
                  <span>New dpt for test</span>".html_safe
                end}
              </span>
          </div>
        </div>
      </div>".html_safe
              end}
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
