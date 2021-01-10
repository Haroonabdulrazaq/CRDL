# frozen_string_literal: true

module ResultsHelper
  def display_sample_control_buttons(result)
    display = ''
    if can? :manage, Result
      display = "
        <div class='column is-5'>
          #{link_to 'Delete', sample_result_path(result), class: 'button is-danger is-outlined', method: :delete,
                                                          data: { confirm: 'Are you sure you want to delete this result?' }}
        </div>
        <div class='column is-5 is-pulled-right'>
          #{link_to 'Edit', edit_sample_result_path(result), class: 'button is-link is-outlined'}
        </div>
      "
    end
    display.html_safe
  end
end
