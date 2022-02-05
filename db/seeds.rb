# frozen_string_literal: true

# default user
User.create!(id: 0,
             name: 'Deleted User',
             email: 'default@example.org',
             password: 'password',
             password_confirmation: 'password',
#             locale: 'en',
             admin: false)

User.create!(name: '1st User (=Admin user)',
             email: 'admin@example.org',
             phone: '1234567890',
             birthday: '2000-01-01',
#             locale: 'en',
             password: 'password',
             password_confirmation: 'password',
             admin: true)

# initial list item
Listitem.create!(item: 'no items yet',
                 done: false)

# just for testing purposes ==================================
if Rails.env == 'development'

  # #10 dummy shoppinglist items
  10.times do
    item = Faker::Lorem.sentence
    Listitem.create!(item: item,
                     done: false)
  end

  # 5 dummy users
  5.times do
    name                  = Faker::Name.name
    email                 = Faker::Internet.email
    phone                 = Faker::PhoneNumber.cell_phone
    birthday              = Faker::Date.backward(days: 11_000)
    description           = Faker::Lorem.paragraph
 #   locale                = 'en',
    password              = 'foobar'
    password_confirmation = 'foobar'
    User.create!(name: name,
                 email: email,
                 phone: phone,
                 password: password,
                 password_confirmation: password_confirmation,
#                 locale: locale,
                 birthday: birthday,
                 description: description,
                 admin: false)
  end

  # 20 dummy news
  20.times do
    user_id     = rand(1..3)
    title       = Faker::Lorem.sentence
    content     = Faker::Lorem.paragraph
    Info.create!(user_id: user_id,
                 title: title,
                 content: content,
                 archived: false)
  end
end
