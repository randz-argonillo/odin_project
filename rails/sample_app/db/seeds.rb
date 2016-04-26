# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

password = 'password'

User.create!(name: 'randy', email: 'randz.argonillo@gmail.com', password: '123456', password_confirmation: '123456', admin: true)

50.times do |n|
  name = Faker::Name.name
  email = Faker::Internet.free_email(name)

  User.create!(name: name, email: email, password: password, password_confirmation: password)
end  