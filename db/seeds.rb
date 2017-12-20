# data sets, just for testing purposes

#10 dummy shoppinglist items
10.times do |n|
  item = Faker::Lorem.sentence
  Listitem.create!(item:         item,
                   done:         false) 
end

#5 dummy users
5.times do |n|
  name                  = Faker::Name.name
  email                 = Faker::Internet.email
  phone                 = Faker::PhoneNumber.cell_phone
  birthday              = Faker::Date.backward(11000)
  description           = Faker::Lorem.paragraph
  password              = "foobar"
  password_confirmation = "foobar"
  User.create!(name: name,
               email: email,
               phone: phone,
               password: password,
               password_confirmation: password_confirmation,
               birthday: birthday,
               description: description,
               admin: false)
end

#20 dummy news
20.times do |n|
  user_id     = rand(1..3)
  title       = Faker::Lorem.sentence
  content     = Faker::Lorem.paragraph
  Info.create!(user_id: user_id,
               title:  title,
               content: content,
               archived: false)
end
