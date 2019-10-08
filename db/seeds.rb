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

List.create(title: "Our New App", user_id: 6)
List.create(title: "Market Research", user_id: 7)

Task.create(description: "Fix the bug on the login page", list_id: 1, completed: false)
Task.create(description: "Call the new client", list_id: 1, completed: false)
Task.create(description: "Brainstorm possible ideas", list_id: 2, completed: false)
Task.create(description: "Hire an intern", list_id: 2, completed: false)

Assignment.create(due_date: "July 1", task_id: 1, user_id: 2)
Assignment.create(due_date: "June 30", task_id: 2, user_id: 6)
Assignment.create(due_date: "September 15", task_id: 3, user_id: 4)
