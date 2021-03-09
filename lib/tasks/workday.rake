namespace :workday do
  desc "Send notification to all workers who hasn't checked in yet"
  task notification: :environment do
    User.where.not(subscription: nil).each do |user|
      subscription_data = JSON.parse(user.subscription)
      puts "push from webpush"
      Webpush.payload_send(
        message: "Time for check in today!",
        endpoint: subscription_data["endpoint"],
        p256dh: subscription_data["keys"]["p256dh"],
        auth: subscription_data["keys"]["auth"],
        vapid: {
          subject: "mailto:sender@example.com",
          public_key: ENV['VAPID_PUBLIC_KEY'],
          private_key: ENV['VAPID_PRIVATE_KEY']
        },
      ssl_timeout: 5, # value for Net::HTTP#ssl_timeout=, optional
      open_timeout: 5, # value for Net::HTTP#open_timeout=, optional
      read_timeout: 5 # value for Net::HTTP#read_timeout=, optional
      )
    end
  end
end
