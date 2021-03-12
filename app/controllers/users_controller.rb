class UsersController < ApplicationController
  def onboarding
    render layout: "nonav"
  end

  def contract_update
    ipa = params[:user][:ipa_photo]
    if defined?(params[:user][:ipa_photo].content_type) == nil
      base_64_image = ipa.gsub!(/^data:.*,/, '')
      decoded_image = Base64.decode64(base_64_image)

      current_user.ipa_photo.attach(
        io: StringIO.new(decoded_image),
        filename: "contract_#{current_user.email}.png"
        )
      if current_user.update(strong_params)
        redirect_to :personal_details
      else
        render :onboarding
      end
    else
      # if current_user.update(strong_upload_params)
      #   redirect_to :personal_details
      # else
      #   render :onboarding
      # end
      current_user.ipa_photo = strong_upload_params[:ipa_photo]
      current_user.save(validate: false)
      redirect_to :personal_details
    end
  end

  def personal_details
  end

  def personal_update
    current_user.name = personal_params[:name]
    current_user.basic_salary = personal_params[:basic_salary]
    current_user.save(validate: false)
    redirect_to root_path
  end

  def send_ipa
    @user = current_user
    @email = params.permit(:email)[:email]
    if @email.match(/\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i)
      UserMailer.with(user: @user, email: @email).send_ipa.deliver_now
    else
      flash.alert = "Not an appropriate email"
    end
  end

  private

  def strong_params
    params.require(:user).permit(:name,:phone_number,:identification_number,:name,:basic_salary,:hourly_salary)
  end
  def strong_upload_params
    params.require(:user).permit(:ipa_photo)
  end
  def personal_params
    params.require(:user).permit(:name,:basic_salary)
  end
end
