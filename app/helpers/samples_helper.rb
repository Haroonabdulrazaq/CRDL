# frozen_string_literal: true

module SamplesHelper
  def sample_params
    params.require(:sample).permit(:name, :Address, :institution, :phone_num, :email, :supervisor_name,
                                   :supervisor_contact, :referrer, :current_status, :required_service,
                                   :description, :perishable, :retention_time, :result_due_date)
  end

  def display_create_result_button(sample)
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

  def display_sample_control_buttons(sample)
    display = ''
    if can? :manage, Sample
      display = "
        <div class='column'>
          #{link_to 'Delete', sample_path, class: 'button is-danger is-outlined', method: :delete,
                                           data: { confirm: 'Are you sure you want to delete this sample?' }}
        </div>
        <div class='column'>
          #{link_to 'Edit', edit_sample_path(sample), class: 'button is-link is-outlined'}
        </div>
      "
    end
    display.html_safe
  end
end
