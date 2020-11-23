# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

99.times do |n|
    name = Faker::Games::Zelda.character
    email = "username#{n+1}@email.org"
    password = "password"
    User.create!(name: name, email: email, password: password, password_confirmation: password)
end

User.create!(name: "Aubrey",
    email: "aubrey@gmail.com",
    password: "password",
    password_confirmation: "password")

users = User.order(:created_at).take(7)
50.times do
    content = Faker::Lorem.sentence(3)
    users.each { |user| user.microposts.create!(content: content) }
end

# Following relationships
users = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }