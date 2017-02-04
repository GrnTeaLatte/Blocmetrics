user = User.create!(
  email: 'food@food.com',
  password:'password',
)

registered_application = RegisteredApplication.create!(
  name: Faker::Lorem.word,
  user: user
)

event = Event.create!(
  name: Faker::Lorem.word,
  registered_application_id: registered_application.id,
)
