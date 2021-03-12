class ApplicationController < ActionController::Base
  # THIS DOESN WORK, i could sign in with email and not phone_number
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:phone_number, :password, :remember_me])
  end
end
