5.times do
    User.create(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: "donut",
        manager: false)
end

2.times do
    User.create(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: "donut",
        manager: true)
end

