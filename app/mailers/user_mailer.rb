class UserMailer < ApplicationMailer
  default from: 'notification@example.com'

  def send_accident
    @recipient = params[:recipient]
    @user = params[:user]
    @accident = params[:accident]
    @subject = "Accident report of #{@user.name}"
    mail(to: @recipient, subject: @subject)
  end

end
