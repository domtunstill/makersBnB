feature 'creating a listing' do
  scenario 'it creates a new listing' do
    user = User.create(name: 'User', email: 'user@user.com', password_digest: 'password')
    visit "/user/#{user.id}"
    expect(current_path).to eq("/user/#{user.id}")
    click_button 'Submit'
    expect(current_path).to eq("/user/#{user.id}/property/new")

    fill_in 'Name', with: 'Makers'
    fill_in 'Description', with: '52 Commercial Place'
    fill_in 'Price (per night)', with: 10
    # click_button 'Submit'

    expect(current_path).to eq("/user/#{user.id}")
    expect(page).to have_content("Makers")
  end
end
