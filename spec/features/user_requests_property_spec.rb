feature 'bookings' do
  # scenario 'user looks at a property to book' do
  #   user = create_user1
  #   create_user2
  #   property = Property.create(user_id: user.id, name: 'Makers', description: '52 Commercial Place', price_per_night: 133)

  #   visit "/property/all"
  #   expect(page).to have_content("Makers", "52 Commercial Place")
  #   expect(page).to have_content("Select check in date")
  #   expect(page).to have_content("Select check out date")
  #   expect(page).to have_button("request_booking")
  # end

  scenario 'booking request is made' do
    user = create_user1
    property = Property.create(user_id: user.id, name: 'Makers', description: '52 Commercial Place', price_per_night: 133)

    login('user@user.com', 'password')

    visit "/property/#{property.id}/booking/new"
    fill_in 'check_in', with: '22/10/2019'
    fill_in 'check_out', with: '23/10/2019'
    click_button 'request_booking'

    expect(page).to have_content('Makers')
    expect(page).to have_content('Check in: Tuesday 22nd October 2019')
    expect(page).to have_content('Check out: Wednesday 23rd October 2019')
    expect(page).to have_content('Pending')
  end

  scenario 'owner sees pending booking' do
    user1 = create_user1
    user2 = create_user2
    property = Property.create(user_id: user2.id, name: 'Makers', description: '52 Commercial Place', price_per_night: 133, available_from: "2019-12-25", available_to: "2020-12-25")

    login('user@user.com', 'password') #user1 logs in

    visit "/property/#{property.id}/booking/new"
    fill_in 'check_in', with: '22/10/2019'
    fill_in 'check_out', with: '23/10/2019'
    click_button 'request_booking'

    login('example@example.com', '123password')

    visit'/user/profile'
    click_button 'booking_requests'
    save_and_open_page
    expect(page).to have_content('Makers')
    expect(page).to have_content('Check in: Tuesday 22nd October 2019')
    expect(page).to have_content('Check out: Wednesday 23rd October 2019')
    expect(page).to have_content('Pending')
  end
end
