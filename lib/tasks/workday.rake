namespace :workday do
  desc "Send sms to all the workers (todo: who hasn't checked in)"
  task notification: :environment do
    WorkdayNotification.deliver(User.all)
  end

end
