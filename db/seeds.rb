puts "Create admin"
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "123456",
             password_confirmation: "123456",
             avatar: "default_user.png",
             admin: true)

puts "Create 5 user"
5.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  avatar = "default_user.png"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               avatar: avatar)
end