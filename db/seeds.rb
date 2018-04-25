require 'faker'
require 'as-duration'

# Admin Users

def loremList
  i = []
  rand(1..5).times do
    i.push(Faker::Lorem.sentence(1, false, 2).tr('.', ''))
  end
  i.join(', ')
end

User.create ({
  name: 'Sonja Page',
  handle: 'sonja',
  password: 'topsecret',
  email: 'spage@mba2018.hbs.edu',
  confirmed_at: Faker::Time.between(2.days.ago, Date.today, :day),
  role: :admin,
  about: Faker::Lorem.paragraph(6, false, 8),
  interests: loremList,
  education: loremList,
  goals_str: loremList
})

User.create ({
  name: 'Karla Mendez',
  handle: 'kmendez',
  password: 'topsecret',
  email: 'kmendez@mba2018.hbs.edu',
  confirmed_at: Faker::Time.between(2.days.ago, Date.today, :day),
  role: :admin,
  about: Faker::Lorem.paragraph(6, false, 8),
  interests: loremList,
  education: loremList,
  goals_str: loremList
})

User.create ({
  name: 'Jason Nedell',
  handle: 'nedell',
  password: 'topsecret',
  email: 'jason@pnc.one',
  confirmed_at: Faker::Time.between(2.days.ago, Date.today, :day),
  role: :admin,
  about: Faker::Lorem.paragraph(6, false, 8),
  interests: loremList,
  education: loremList,
  goals_str: loremList
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
  role: :recipient,
  about: Faker::Lorem.paragraph(6, false, 8),
  interests: loremList,
  education: loremList,
  goals_str: loremList
})

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
    role: :recipient,
    about: Faker::Lorem.paragraph(6, false, 8),
    interests: loremList,
    education: loremList,
    goals_str: loremList
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
  role: :donor,
  about: Faker::Lorem.paragraph(6, false, 8),
  interests: loremList,
  education: loremList,
  goals_str: loremList
})

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
    role: :donor,
    about: Faker::Lorem.paragraph(6, false, 8),
    interests: loremList,
    education: loremList,
    goals_str: loremList
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

120.times do
  goal = Goal.all.sample
  amount = rand * ((goal.amount.dollars.to_i * 0.2) - 1) + 1

  n = Faker::Number.between(0, 20)

  status = if n.between?(0, 8)
             :created
           elsif n.between?(9, 15)
             :confirmed
           elsif n.between?(16, 18)
             :modified
           else
             :declined
           end

  diffAmount = status.equal? :modified ?
               Faker::Number.between(1, 4) :
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
           'mdi-wan', 'mdi-stadium', 'mdi-security-home', 'mdi-power']

  c = Resource.create ({
    name: Faker::Company.unique.name,
    slug: Faker::Company.catch_phrase,
    desc: Faker::Lorem.paragraph(6, false, 8),
    email: Faker::Internet.unique.email,
    icon: icons.sample
  })
end
