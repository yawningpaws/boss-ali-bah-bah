# To deliver this notification:
#
# WorkdayNotification.with(post: @post).deliver_later(current_user)
# WorkdayNotification.with(post: @post).deliver(current_user)

class WorkdayNotification < Noticed::Base
  # Add your delivery methods
  #
  # deliver_by :database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"
  deliver_by :twilio, credentials: :get_twilio_credentials

  # Add required params
  #
  # param :post

  # Define helper methods to make rendering easier.
  def message
    t(".message")
  end

  def url
    post_path(params[:post])
  end

  private

  def get_twilio_credentials
    {
      account_sid: ENV['TWILIO_ACCOUNT_SID'],
      auth_token: ENV['TWILIO_AUTH_TOKEN'],
      phone_number: ENV['TWILIO_PHONE_NUMBER']
    }
  end
end
