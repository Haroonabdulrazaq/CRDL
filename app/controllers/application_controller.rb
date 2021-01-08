# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # def current_sample
  #   @current_sample = @sample.id
  # end
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name])
  end
end
