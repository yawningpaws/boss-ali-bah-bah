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
      if current_user.update(strong_upload_params)
        redirect_to :personal_details
      else
        render :onboarding
      end
    end
  end

  def personal_details
  end

  def personal_update
    if(current_user.update(personal_params))
      redirect_to root_path
    else
      render :personal_details
    end
  end

  private

  def strong_params
    params.require(:user).permit(:name,:phone_number,:identification_number,:name,:basic_salary,:hourly_salary)
  end
  def strong_upload_params
    params.require(:user).permit(:name,:phone_number,:identification_number,:name,:basic_salary,:hourly_salary,:ipa_photo)
  end
  def personal_params
    params.require(:user).permit(:name,:phone_number,:identification_number,:name,:basic_salary)
  end
end
