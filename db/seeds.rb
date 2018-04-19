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

u = User.create ({
  name: 'Renly Baratheon',
  handle: 'lordparamount',
  handle_cash: 'renly',
  handle_venmo: 'renly',
  handle_paypal: 'renly.b',
  password: 'topsecret',
  email: 'renly@theredkeep.com',
  confirmed_at: Faker::Time.between(2.days.ago, Date.today, :all),
  role: :recipient
})

10.times do
  cash = Faker::Boolean.boolean(0.9)
  venmo = Faker::Boolean.boolean(0.4)
  paypal = Faker::Boolean.boolean(0.3)

  u = User.create ({
    name: Faker::GameOfThrones.unique.character,
    handle: Faker::Internet.unique.user_name,
    password: 'topsecret',
    email: Faker::Internet.unique.free_email,
    confirmed_at: Faker::Time.between(2.days.ago, Date.today, :all),
    role: :recipient
  })

  u.update(handle_cash: Faker::Internet.unique.user_name) if cash
  u.update(handle_venmo: Faker::Internet.unique.user_name) if venmo
  u.update(handle_paypal: Faker::Internet.unique.user_name) if paypal
end

# Donors

u = User.create ({
  name: 'Harry Potter',
  handle: 'thechosenone',
  handle_cash: 'harrypotter',
  handle_venmo: 'harry',
  handle_paypal: 'potter',
  password: 'topsecret',
  email: 'harry@potter.com',
  confirmed_at: Faker::Time.between(2.days.ago, Date.today, :all),
  role: :donor
})

10.times do
  cash = Faker::Boolean.boolean(0.9)
  venmo = Faker::Boolean.boolean(0.4)
  paypal = Faker::Boolean.boolean(0.3)

  u = User.create ({
    name: Faker::HarryPotter.unique.character,
    handle: Faker::Internet.unique.user_name,
    password: 'topsecret',
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

30.times do
  Goal.create ({
    user: User.where(role: :recipient).sample,
    name: Faker::Commerce.product_name,
    desc: Faker::Hobbit.quote,
    amount: Faker::Number.between(25, 300).to_money,
    posted: (1.day + 3.hour).ago,
    public: true,
    deleted: false
  })
end

# Favorites

20.times do
  Favorite.create ({
    user: User.where(role: :donor).sample,
    goal: Goal.all.sample
  })
end

# Donations

40.times do
  goal = Goal.all.sample
  amount = rand * ((goal.amount.dollars.to_i * 0.2) - 1) + 1

  n = Faker::Number.between(0, 20)

  if n.between?(0, 8)
    status = :created
  elsif n.between?(9,15)
    status = :confirmed
  elsif n.between?(16,18)
    status = :modified
  else
    status = :declined
  end

  diffAmount = (status.equal? :modified) ?
               Faker::Number.between(1,4) :
               0

  msgDonor = Faker::DrWho.quote if Faker::Boolean.boolean(0.5)
  msgRecip = Faker::OnePiece.quote if Faker::Boolean.boolean(0.2)

  Donation.create ({
    user: User.where(role: :donor).sample,
    goal: goal,
    amount: amount.to_money,
    amount_actual: (amount + diffAmount).to_money,
    message_donor: msgDonor,
    message_recipient: msgRecip,
    status: status
  })
end

# Categories

12.times do
  icons = ['mdi-airballoon', 'mdi-airplane', 'mdi-bowling', 'mdi-diamond',
           'mdi-gauge-low', 'mdi-hamburger', 'mdi-key', 'mdi-motorbike',
           'mdi-music', 'mdi-rice', 'mdi-tooth', 'mdi-tshirt-v',
           'mdi-wan', 'mdi-stadium', 'mdi-secuirty-home', 'mdi-power']

  c = Resource.create ({
    name: Faker::Company.unique.buzzword,
    desc: Faker::Company.catch_phrase,
    icon: icons.sample
  })
end

