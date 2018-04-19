require 'faker'
require 'as-duration'

# Admin Users

User.create ({
  name: 'Sonja Page',
  handle: 'sonja',
  password: 'topsecret',
  email: 'spage@mba2018.hbs.edu',
  confirmed_at: Faker::Time.between(2.days.ago, Date.today, :day),
  role: :admin
})

User.create ({
  name: 'Karla Mendez',
  handle: 'kmendez',
  password: 'topsecret',
  email: 'kmendez@mba2018.hbs.edu',
  confirmed_at: Faker::Time.between(2.days.ago, Date.today, :day),
  role: :admin
})

User.create ({
  name: 'Jason Nedell',
  handle: 'nedell',
  password: 'topsecret',
  email: 'jason@pnc.one',
  confirmed_at: Faker::Time.between(2.days.ago, Date.today, :day),
  role: :admin
})

# Recipients

10.times do
  User.create ({
    name: Faker::GameOfThrones.unique.character,
    handle: Faker::Internet.unique.user_name,
    password: Faker::Internet.password(10, 20),
    email: Faker::Internet.unique.free_email,
    confirmed_at: Faker::Time.between(2.days.ago, Date.today, :all),
    role: :recipient
  })
end

# Donors

10.times do
  User.create ({
    name: Faker::HarryPotter.unique.character,
    handle: Faker::Internet.unique.user_name,
    password: Faker::Internet.password(10, 20),
    email: Faker::Internet.unique.free_email,
    confirmed_at: Faker::Time.between(2.days.ago, Date.today, :all),
    role: :donor
  })
end

# Goals

recipients = User.where(role: :recipient)

30.times do
  Goal.create ({
    user: recipients.where(id: rand(recipients.count)).take,
    name: Faker::Book.title,
    desc: Faker::Hobbit.quote,
    amount: (Faker::Number.between(1, 25).to_s + '.' + Faker::Number.between(0, 99).to_s).to_money,
    posted: (1.day + 3.hour).ago,
    public: true,
    deleted: false
  })
end

