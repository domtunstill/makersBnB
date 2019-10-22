def create_user1
  user = User.create(name: 'User', email: 'user@user.com', password: 'password')
end

def create_user2
  user = User.create(name: 'Example', email: 'example@example.com', password: '123password')
end

def create_new_property
  user = create_user1

  property = Property.create(user_id: user.id, name: 'Makers', description: '52 Commercial Place', price_per_night: 133)
end
