# frozen_string_literal: true

module SamplesHelper
  def sample_params
    params.require(:sample).permit(:name, :Address, :institution, :phone_num, :email, :supervisor_name,
                                   :supervisor_contact, :referrer, :current_status, :required_service,
                                   :description, :perishable, :retention_time, :result_due_date)
  end
end
