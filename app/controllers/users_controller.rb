class UsersController < ApplicationController

 def edit
  @user = User.find(current_user[:id])
end

  def onboarding
    @user = User.new(strong_params)
  end

private

def strong_params
  params.require(:user).permit(:phone_number,:identification_number,:name,:basic_salary,:hourly_salary)
end
end
