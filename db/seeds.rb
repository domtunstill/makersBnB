duncan = User.create(name: 'Duncan Skinner', email: 'duncanskinner94@gmail.com', password: 'password')
olly = User.create(name: 'Olly Holovchenko', email: 'oleh.holo@gmail.com', password: 'password')
nat = User.create(name: 'Nat Elliott-Green', email: 'natelliottgreen34@gmail.com', password: 'password')
dom = User.create(name: 'Dominic Tunstill', email: 'dteezle@gmail.com', password: 'password')

Property.create(
  user_id: duncan.id,
  name: 'Duncan_prop_1',
  description: 'A cosy place',
  price_per_night: 500,
  image: 'https://images.unsplash.com/photo-1519263225643-c2abb3eca8f5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=680&q=80',
  booked: false,
  available_from: '2019-10-23',
  available_to: '2019-12-31'
)

Property.create(
  user_id: duncan.id,
  name: 'Duncan_prop_2',
  description: 'A cosy place',
  price_per_night: 750,
  image: 'https://images.unsplash.com/photo-1502005229762-cf1b2da7c5d6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80',
  booked: false,
  available_from: '2019-10-23',
  available_to: '2019-12-31'
)

Property.create(
  user_id: olly.id,
  name: 'Olly_prop_2',
  description: 'The shack',
  price_per_night: 600,
  image: 'https://images.unsplash.com/photo-1480074568708-e7b720bb3f09?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1506&q=80',
  booked: false,
  available_from: '2019-10-23',
  available_to: '2019-12-31'
)

Property.create(
  user_id: olly.id,
  name: 'Olly_prop_2',
  description: 'The mansion',
  price_per_night: 450,
  image: 'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80',
  booked: false,
  available_from: '2019-10-23',
  available_to: '2019-12-31'
)

Property.create(
  user_id: nat.id,
  name: 'Nat_prop_1',
  description: 'The love shack',
  price_per_night: 800,
  image: 'https://images.unsplash.com/photo-1518780664697-55e3ad937233?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=802&q=80',
  booked: false,
  available_from: '2019-10-23',
  available_to: '2019-12-31'
)

Property.create(
  user_id: nat.id,
  name: 'Nat_prop_2',
  description: 'The hut',
  price_per_night: 200,
  image: 'https://images.unsplash.com/photo-1493809842364-78817add7ffb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80',
  booked: false,
  available_from: '2019-10-23',
  available_to: '2019-12-31'
)

Property.create(
  user_id: dom.id,
  name: 'Dom_prop_1',
  description: 'The cottage',
  price_per_night: 700,
  image: 'https://images.unsplash.com/photo-1567002260893-954a299f8c6b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80',
  booked: false,
  available_from: '2019-10-23',
  available_to: '2019-12-31'
)

Property.create(
  user_id: dom.id,
  name: 'Dom_prop_2',
  description: 'The dream house',
  price_per_night: 5,
  image: 'https://images.unsplash.com/photo-1548727859-f2ec438629a6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1791&q=80',
  booked: false,
  available_from: '2019-10-23',
  available_to: '2019-12-31'
)
