User.destroy_all


Teachent.destroy_all

User.create(username: "whatever", password: "something")

50.times do
    User.create(username: Faker::FunnyName.name, password: SecureRandom.hex(10))
end