class UserMailer < ApplicationMailer
  default from: 'notification@example.com'

  def send_accident
    @recipient = params[:recipient]
    @user = params[:user]
    @accident = params[:accident]
    @subject = "Accident report of #{@user.name}"
    mail(to: @recipient, subject: @subject)
  end

  def send_worklog(email, csv)
    @user = params[:user]
    @date = params[:date]
    attachments["#{@user.name}_#{@date}_worklog.csv"] = { mime_type: 'text/csv', content: csv }
    mail(to: email, subject: "Worklog for #{@user.name} #{@date.to_date.strftime('%B, %Y')}", body: 'Attached is the requested worklog.')
  end

  def send_payslip
    @user = params[:user]
    @email = params[:email]
    @payslip = params[:payslip]
    mail(to: @email, subject: "#{Date::MONTHNAMES[@payslip.month]}, #{@payslip.year} payslip for #{@user.name} ")
  end

  def send_ipa
    @user = params[:user]
    @email = params[:email]
    mail(to: @email, subject: "IPA of #{@user.name}")
  end
end
