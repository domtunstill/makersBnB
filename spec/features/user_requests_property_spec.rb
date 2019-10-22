feature 'bookings' do
  scenario 'user looks at a property to book' do
    user = create_user1
    create_user2
    property = Property.create(user_id: user.id, name: 'Makers', description: '52 Commercial Place', price_per_night: 133)

    visit "/property/#{property.id}/booking/new"
    expect(page).to have_content("Makers", "52 Commercial Place")
    expect(page).to have_content("Select check in date")
    expect(page).to have_content("Select check out date")
    expect(page).to have_button("request_booking")
  end

  scenario 'booking is confirmed' do
    user = create_user1
    property = Property.create(user_id: user.id, name: 'Makers', description: '52 Commercial Place', price_per_night: 133)

    visit '/login'
    fill_in 'email', with: 'user@user.com'
    fill_in 'password', with: 'password'
    click_button 'Submit'

    visit "/property/#{property.id}/booking/new"
    fill_in 'check_in', with: '22/10/2019'
    fill_in 'check_out', with: '23/10/2019'
    click_button 'request_booking'

    expect(page).to have_content('Makers')
    expect(page).to have_content('22/10/2019')
  end
end
