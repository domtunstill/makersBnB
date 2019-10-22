feature 'Authentication' do
  scenario 'User logs in' do
    User.create(name: 'Exxy Exemplar', email:'test@example.com', password:'password123')

    visit '/login'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Submit')

    expect(page).to have_content 'Welcome to MakersBnB Exxy Exemplar'
  end

  scenario 'User enters wrong login details' do
    User.create(name: 'Exxy Exemplar', email:'test@example.com', password:'password123')

    visit '/login'
    fill_in('email', with: 'hi@bye.com')
    fill_in('password', with: 'aloha')
    click_button('Submit')

    expect(page).not_to have_content 'Welcome to MakersBnB Exxy Exemplar'
    expect(page).to have_content 'Email or password is incorrect, try again'
  end

  scenario 'User enters wrong password' do
    User.create(name: 'Exxy Exemplar', email:'test@example.com', password:'password123')

    visit '/login'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password')
    click_button('Submit')

    expect(page).not_to have_content 'Welcome to MakersBnB Exxy Exemplar'
    expect(page).to have_content 'Email or password is incorrect, try again'
  end

  scenario 'User signs out' do
    User.create(name: 'Exxy Exemplar', email:'test@example.com', password:'password123')

    visit '/login'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Submit')

    click_link('Log Out')

    expect(page).not_to have_content 'Welcome to MakersBnB Exxy Exemplar'
    expect(page).to have_content 'You have signed out'
  end
end
