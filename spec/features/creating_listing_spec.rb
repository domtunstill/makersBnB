feature 'creating a listing' do
  scenario 'it creates a new listing' do
    user = User.create(name: 'User', email: 'user@user.com', password: 'password')
    
    visit "/user/#{user.id}"
    expect(current_path).to eq("/user/#{user.id}")
    click_button 'Submit'
    expect(current_path).to eq("/user/#{user.id}/property/new")

    fill_in 'name', with: 'Makers'
    fill_in 'description', with: '52 Commercial Place'
    fill_in 'price', with: 133
    click_button 'Submit'

    expect(current_path).to eq("/user/#{user.id}")
    expect(page).to have_content("Makers")
  end
end
