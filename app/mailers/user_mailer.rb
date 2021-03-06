class UserMailer < ApplicationMailer
  default from: 'notification@example.com'

  def send_accident
    binding.pry
    @recipient = params[:recipient]
    @user = params[:user]
    @accident = params[:accident]
    @user.name = 'chris'
    @subject = "Accident report of #{@user.name}"
    mail(to: @recipient, subject: @subject)
  end

end
