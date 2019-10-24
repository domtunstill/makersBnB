def sign_up
    visit '/signup'
    fill_in('email', with: 'user@user.com')
    fill_in('name', with: 'User')
    fill_in('password', with: 'password')
    click_button('Submit')
end

def login(email, password)
    visit '/login'
    fill_in('email', with: email)
    fill_in('password', with: password)
    click_button('Submit')
end

def logout
    visit '/home'
    click_button('Log Out')
end

def login_user2
    visit '/login'
    fill_in('email', with: 'example@example.com')
    fill_in('password', with: 'password')
    click_button('Submit')
end

def add_listing
    fill_in 'name', with: 'Makers'
    fill_in 'description', with: '52 Commercial Place'
    fill_in 'price', with: 133
    click_button 'Submit'
end

def create_user1
    user = User.create(name: 'User', email: 'user@user.com', password: 'password')
  end

  def create_user2
    user = User.create(name: 'Example', email: 'example@example.com', password: '123password')
  end

  def create_new_property
    user = create_user1

    property = Property.create(user_id: user.id, name: 'Makers', description: '52 Commercial Place', price_per_night: 133, available_from: "2019-12-25", available_to: "2020-12-25")
  end