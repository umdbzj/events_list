# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: "Example User",
             email: "example@railstutorial.org",
             password: "foobar",
             password_confirmation: "foobar",
             admin: true)
             
2.times do |n|
	name = Faker::Name.name
	email = "example-#{n+1}@railstutorial.org"
	password = "password"
	User.create!(name: name,
				 email: email,
				 password: password,
				 password_confirmation: password)
end



users = User.order(:created_at).take(3)

# old events that should not get pulled for upcoming events
2.times do
	content = Faker::Lorem.sentence(1)
	users.each {
		|user| user.events.create!(content: content, starts: 2.days.ago)
	}
end

2.times do
	content = Faker::Lorem.sentence(1)
	users.each {
		|user| user.events.create!(content: content, starts: Time.zone.now)
	}
end
