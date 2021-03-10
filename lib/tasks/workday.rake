namespace :workday do
  desc "Send sms to all the workers (todo: who hasn't checked in)"
  task notification: :environment do
    WorkdayNotification.with(message: 'Please check in today! https://boss-ali-bah-bah.herokuapp.com/workdays/new').deliver(User.last)
  end
end
