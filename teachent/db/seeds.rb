# User.destroy_all


# Teachent.destroy_all
User.create(name: "chyrelle", email: "chyrelle@gmail.com", password: "password")
# chyrelle = User.create(name: "chyrelle", email: "chyrelle@gmail.com", password: "password")
# tom = User.create(name: "tom", email: "tom@gmail.com", password: "password")

10.times do
    User.create(name: Faker::FunnyName.name, email: Faker::Internet.email, password: SecureRandom.hex(7))
end

#  Teachent.create(course_name: "intro to C#", user_id: chyrelle.id)

# # chyrelle.teachents.create(course_name: "How to think right")
# toms_entry = tom.teachents.build(course:  "How to dream big")
# toms_entry.save