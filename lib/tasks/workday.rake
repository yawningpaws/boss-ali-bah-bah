namespace :workday do
  desc "Send sms to all the workers (todo: who hasn't checked in)"
  task notification: :environment do
    users_to_notify = User.all.select do |user|
      !user.workdays.any? { |workday| workday.date == Date.today }
    end
    WorkdayNotification.with(message: 'Please check in today! https://boss-ali-bah-bah.herokuapp.com/workdays/new').deliver(users_to_notify)
  end
end
