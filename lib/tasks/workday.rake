namespace :workday do
  desc "Send sms to all the workers (todo: who hasn't checked in)"
  task notification: :environment do
    WorkdayNotification.with(message: 'Please check you bloody app').deliver(User.last)
  end

end
