feature 'Signing Up to MakersBnb' do
  scenario 'A user signs up for the first time' do
    visit '/signup'
    fill_in('email', with: 'test@example.com')
    fill_in('name', with: 'Exxy Exemplar')
    fill_in('password', with: 'password123')
    click_button('Submit')
    
    expect(page).to have_content 'Welcome to MakersBnb Exxy Exemplar'
  end
end
