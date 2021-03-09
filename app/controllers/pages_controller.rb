class PagesController < ApplicationController
  def home
    if !user_signed_in?
      redirect_to landing_path
    else
      @workday_checkedin = Workday.where("user_id = ? and date = ? and start_time is not null", current_user.id,Date.today)[0]
    end
    @decodedVapidPublicKey = Base64.urlsafe_decode64(ENV['VAPID_PUBLIC_KEY']).bytes
  end

  def calendar
    @workdays = Workday.where(user: current_user)
    @payslips = Payslip.where(user: current_user)
    @basic_salary = current_user.basic_salary
  end

  # def notification
  #   Webpush.payload_send(
  #     message: params[:message],
  #     endpoint: params[:subscription][:endpoint],
  #     p256dh: params[:subscription][:keys][:p256dh],
  #     auth: params[:subscription][:keys][:auth],
  #     vapid: {
  #       subject: "mailto:sender@example.com",
  #       public_key: ENV['VAPID_PUBLIC_KEY'],
  #       private_key: ENV['VAPID_PRIVATE_KEY']
  #     },
  #     ssl_timeout: 5, # value for Net::HTTP#ssl_timeout=, optional
  #     open_timeout: 5, # value for Net::HTTP#open_timeout=, optional
  #     read_timeout: 5 # value for Net::HTTP#read_timeout=, optional
  #   )
  # end
end
