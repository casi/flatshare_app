User.create!(name:                  "Example User",
            email:                  "example@example.org",
            password:               "password",
            password_confirmation:  "password",
            admin: true)


#3 dummy users
3.times do |n|
  name                  = Faker::Name.name
  email                 = Faker::Internet.email
  birthday              = Faker::Date.backward(11000)
  description           = Faker::Lorem.paragraphs(5)
  password              = "foobar"
  password_confirmation = "foobar"
  picture               = "#{rand(5)}.jpg"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password_confirmation,
               picture: picture,
               admin: false)
end