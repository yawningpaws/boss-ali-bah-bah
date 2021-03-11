# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Article.destroy_all;

Article.create!(title:"How much can I expect to be paid each month?" ,content:"You will be paid the “BASIC MONTHLY SALARY” in your IPA if you work 44 hours a week.
  Your “FIXED MONTHLY SALARY” is higher because that includes money your boss uses for your food and housing.
  If you work more than 44 hours a week or on your rest days, your hourly pay will be calculated based on your “BASIC MONTHLY SALARY”.")

Article.create!(title:"How is my hourly pay calculated?",content:"Hourly pay = (12 x basic monthly salary) divided by (52 weeks in a year x 44 hours a week)
  You can find your basic monthly salary in your IPA.")

Article.create!(title:"When can I be paid overtime pay?" ,content:"If you work more than 44 hours a week, not including meal breaks, you should be paid overtime pay.
  Your overtime pay is 1.5 times your hourly pay.")

Article.create!(title:"How much should I be paid if I work on my rest day?" ,content:"If you work 4 hours or less on your rest day, you will be paid 8 times your hourly pay.
  If you work 4-8 hours, you will be paid 16 times your hourly pay.
  You must have 1 rest day every 7 days.")

Article.create!(title:"
What should I do if my boss wants to force me to fly home?" ,content:"Tell airport police that your boss is forcing you to fly home. They can allow you to stay in Singapore to file a complaint at MOM.")

Article.create!(title:"When should I expect my boss to pay me?" ,content:"You should receive your salary at least once a month, and no more than 7 days after the salary period (the month that you are being paid for).")

Article.create!(title:"My boss said that there is no work so he is not paying me." ,content:"Your boss must pay you even if he does not give you work.")

Article.create!(title:"If my boss has not paid me for 2 years, will I be able to claim it all back?" ,content:"You can only claim up to 1 year of unpaid or underpaid salary from the date of your claim. Seek help if your boss has not paid you for a long period.")

Article.create!(title:"Must my boss pay me when I am on MC?" ,content:"If you have worked more than 6 months, you should be paid for 14 days of MC if you are not in the hospital, or 60 days of MC if you are in the hospital.")
