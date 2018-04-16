require 'faker'

u1 = User.create ({
  name: 'Sonja Page',
  handle: 'sonja',
  password: 'topsecret',
  email: 'spage@mba2018.hbs.edu',
  role: :admin
})

u2 = User.create ({
  name: 'Karla Mendez',
  handle: 'kmendez',
  password: 'topsecret',
  email: 'kmendez@mba2018.hbs.edu',
  role: :admin
})

u3 = User.create ({
  name: 'Jason Nedell',
  handle: 'nedell',
  password: 'topsecret',
  email: 'jason@pnc.one',
  role: :admin
})

u4 = User.create ({
  name: 'Rickon Stark',
  handle: 'ricon',
  password: 'topsecret',
  email: 'rickon@north.com',
  role: :recipient
})

u5 = User.create ({
  name: 'Myrcella Baratheon',
  handle: 'princess',
  password: 'topsecret',
  email: 'princess@theredkeep.gov',
  role: :recipient
})

Goal.create ({
  user: u4,
  name: 'Pay November Rent',
  desc: 'I need some help paying my rent for this month. All proceeds '\
        'go directly to my landlord!',
  amount: 300,
  posted: (1.day + 3.hour).ago,
  public: true,
  deleted: false
})

Goal.create ({
  user: u4,
  name: 'Buy Week\'s Groceries',
  desc: 'Items include eggs, milk, vegetables, and rice.',
  amount: 40,
  posted: (1.day + 10.hour).ago,
  public: true,
  deleted: false
})

Goal.create ({
  user: u5,
  name: 'Christmas Present for Kids',
  desc: 'My children need as many Bionicles as possible! Please help '\
        'me buy 10 of them so my son can unite them into the Toa Muta',
  amount: 70,
  posted: (2.day + 1.hour).ago,
  public: true,
  deleted: false
})

Goal.create ({
  user: u5,
  name: 'Bus Fare',
  desc: 'Looking to obtain bus fair for the month so I can commute to work',
  amount: 70,
  posted: (1.day + 3.hour).ago,
  public: true,
  deleted: false
})
