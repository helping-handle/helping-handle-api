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
  cash = Faker::Boolean.boolean(0.9)
  venmo = Faker::Boolean.boolean(0.4)
  paypal = Faker::Boolean.boolean(0.3)

  u = User.create ({
    name: Faker::GameOfThrones.unique.character,
    handle: Faker::Internet.unique.user_name,
    password: Faker::Internet.password(10, 20),
    email: Faker::Internet.unique.free_email,
    confirmed_at: Faker::Time.between(2.days.ago, Date.today, :all),
    role: :recipient
  })

  u.update(handle_cash: Faker::Internet.unique.user_name) if cash
  u.update(handle_venmo: Faker::Internet.unique.user_name) if venmo
  u.update(handle_paypal: Faker::Internet.unique.user_name) if paypal
end

# Donors

10.times do
  cash = Faker::Boolean.boolean(0.9)
  venmo = Faker::Boolean.boolean(0.4)
  paypal = Faker::Boolean.boolean(0.3)

  u = User.create ({
    name: Faker::HarryPotter.unique.character,
    handle: Faker::Internet.unique.user_name,
    password: Faker::Internet.password(10, 20),
    email: Faker::Internet.unique.free_email,
    confirmed_at: Faker::Time.between(2.days.ago, Date.today, :all),
    role: :donor
  })

  u.update(handle_cash: Faker::Internet.unique.user_name) if cash
  u.update(handle_venmo: Faker::Internet.unique.user_name) if venmo
  u.update(handle_paypal: Faker::Internet.unique.user_name) if paypal
end

# Categories

6.times do
  icons = ['mdi-airballoon', 'mdi-airplane', 'mdi-bowling', 'mdi-diamond',
           'mdi-gauge-low', 'mdi-hamburger', 'mdi-key', 'mdi-motorbike',
           'mdi-music', 'mdi-rice', 'mdi-tooth', 'mdi-tshirt-v',
           'mdi-wan', 'mdi-stadium', 'mdi-secuirty-home', 'mdi-power']

  c = Category.create ({
    name: Faker::Book.unique.title,
    desc: Faker::Dune.quote,
    icon: icons.sample
  })
end

# Goals

recipients = User.where(role: :recipient)

30.times do
  Goal.create ({
    user: recipients.where(id: rand(recipients.count)).take,
    name: Faker::Commerce.product_name,
    desc: Faker::Hobbit.quote,
    amount: (Faker::Number.between(1, 25).to_s + '.' + Faker::Number.between(0, 99).to_s).to_money,
    posted: (1.day + 3.hour).ago,
    public: true,
    deleted: false
  })
end

# Favorites

donors = User.where(role: :donor)
goals = Goal.all

20.times do
  Favorite.create ({
    user: donors.where(id: rand(donors.count)).take,
    goal: goals.where(id: rand(goals.count)).take
  })
end