# frozen_string_literal: true

module ResultsHelper

  def display_result_control_buttons result
    display = ''
    if can? :manage, Result
      display = "
        <div class='column is-5 is-pulled-right'>
          #{link_to 'Edit', edit_sample_result_path(result.sample.id, result), class: 'button is-link is-outlined'}		
        </div>
      "
    end
    display.html_safe
  end
end
