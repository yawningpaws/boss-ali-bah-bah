class SessionsController < Devise::SessionsController
  # THIS DOESNT WORK, i could sign in with email and not phone_number
  private

  def sign_in_params
    params.require(:user).permit(:phone_number, :password)
  end
end
