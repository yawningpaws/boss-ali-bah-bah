# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Organisation.create!(name: 'TWC', address:  '#09-86, Beach Rd, Golden Mile Complex, 199588',opening_time: '9am',closing_time: '6pm',phone_number: '6247 7001',email_address: 'info@twc2.org.sg',website: 'twc2.org.sg',latitude: 1.3030873766686772,longitude: 103.86526041048982)
Organisation.create!(name: 'HOME - North Bridge' , address: '111 North Bridge Rd, #05-22 Peninsula Plaza, Singapore 179098',opening_time: '10am',closing_time: '6:30pm',phone_number: '6341 5535',email_address: 'nurezlia@home.org.sg',website: 'home.org.sg',latitude: 1.292610803938271,longitude: 103.85077648350223)
Organisation.create!(name: 'HOME - Geylang', address: '810 Geylang Road, City Plaza, #02-95, Singapore 40928',opening_time: '10am',closing_time: '6:30pm',phone_number: '6341 5535',email_address: 'nurezlia@home.org.sg ',website: 'home.org.sg',latitude: 1.3154079454383143,longitude: 103.89375127635545)
Organisation.create!(name: 'HOME - Lucky Plaza', address: '304 Orchard Road, Lucky Plaza, #06-22, Singapore 238863',opening_time: '10am',closing_time: '6:30pm',phone_number: '6341 5535',email_address: 'nurezlia@home.org.sg ',website: 'home.org.sg',latitude: 1.3053477607959247,longitude: 103.83399143827864)
Organisation.create!(name: 'HealthServe - Jln Besar', address: '151A Jln Besar, Singapore 208869',opening_time: '10am',closing_time: '6:30pm',phone_number: '64933282',email_address: 'info@healthserve.org.sg',website: 'http://www.healthserve.org.sg/',latitude: 1.3083664218267992,longitude: 103.85636325045485)
Organisation.create!(name: 'HealthServe - Aspri', address: '5D Jln Papan, #01-34/36 Aspri Westlite Papan, Singapore 619421',opening_time: '10am',closing_time: '6:30pm',phone_number: '83649901',email_address: 'info@healthserve.org.sg ',website: 'http://www.healthserve.org.sg/',latitude: 1.3239715337267655 ,longitude: 103.7275271032213)
Organisation.create!(name: 'HealthServe - Westlite Domitory', address: 'Westlite Dormitory
36 Mandai Estate, #00-00',opening_time: '10am',closing_time: '6:30pm',phone_number: '6635 8372',email_address: 'info@healthserve.org.sg',website: 'http://www.healthserve.org.sg/',latitude: 1.4116805001068844,longitude:103.75860438879701)
Organisation.create!(name: 'SG Accident Help Centre', address: '6 Flanders Square',opening_time: '10am',closing_time: '6:30pm',phone_number: '6291 0751',email_address: 'info@mysite.com',website: 'https://www.sgaccident.org.sg/copy-of-contact',latitude: 1.312667971502342,longitude: 103.85759574133353)
Organisation.create!(name: 'Migrant Workers Centre', address: '51 Soon Lee Rd, Migrant Workers Centre Recreation Club, Singapore 628088',opening_time: '9am',closing_time: '7pm',phone_number: '65362692',email_address: 'sip@mwc.org.sg',website: 'http://www.mwc.org.sg/',latitude: 1.33291179549632,longitude: 103.69914502598799)
Organisation.create!(name: 'ACMI', address: '#04-01, Agape Village, 319264, 7 Lor 8 Toa Payoh, Singapore 319252',opening_time: '8:30am',closing_time: '5:30pm',phone_number: '68017400',email_address: 'sip@mwc.org.sg',website: 'http://www.mwc.org.sg/',latitude: 1.340306694748082, longitude: 103.85713864133348)

Article.create!(title:"When am I entitled to overtime pay?" ,content:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus auctor convallis erat, vel tempus mauris congue sed. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae")
Article.create!(title:"How much should I expect to receive each month?" ,content:"Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
Article.create!(title:"What should I do if my boss wants to deport me?" ,content:"Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
