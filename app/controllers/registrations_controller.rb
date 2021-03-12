class RegistrationsController < Devise::RegistrationsController
  def after_sign_up_path_for(resource)
    onboarding_path(current_user.id)
  end

  private

  def sign_up_params
    params.require(:user).permit(:phone_number, :password, :password_confirmation)
  end
end
