def sign_up
    visit '/signup'
    fill_in('email', with: 'user@user.com')
    fill_in('name', with: 'User')
    fill_in('password', with: 'password')
    click_button('Submit')
end

def login
    visit '/login'
    fill_in('email', with: 'user@user.com')
    fill_in('password', with: 'password')
    click_button('Submit')
end

def add_listing
    fill_in 'name', with: 'Makers'
    fill_in 'description', with: '52 Commercial Place'
    fill_in 'price', with: 133
    click_button 'Submit'
end
