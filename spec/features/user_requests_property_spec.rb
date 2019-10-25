feature 'bookings' do

  scenario 'booking request is made' do
    user = create_user1
    property = Property.create(user_id: user.id, name: 'Makers', description: '52 Commercial Place', price_per_night: 133)

    login('user@user.com', 'password')

    visit "/property/#{property.id}"
    fill_in 'Check In', with: '22/10/2019'
    fill_in 'Check Out', with: '23/10/2019'
    click_button 'Book'

    expect(page).to have_content('Makers')
    expect(page).to have_content('Tuesday 22nd October 2019')
    expect(page).to have_content('Wednesday 23rd October 2019')
    expect(page).to have_content('Pending')
  end

  scenario 'owner sees pending booking' do
    user1 = create_user1
    user2 = create_user2
    property = Property.create(user_id: user2.id, name: 'Makers', description: '52 Commercial Place', price_per_night: 133, available_from: "2019-12-25", available_to: "2020-12-25")

    login('user@user.com', 'password') #user1 logs in and books

    visit "/property/#{property.id}/booking/new"
    fill_in 'check_in', with: '10/11/2019'
    fill_in 'check_out', with: '11/11/2019'
    click_button 'request_booking'

    login('example@example.com', '123password') #user2 logs in and checks bookings

    visit'/user/profile'
    expect(page).to have_content('Makers')
    expect(page).to have_content('Sun 10th November 2019')
    expect(page).to have_content('Mon 11th November 2019')
    expect(page).to have_content('Pending')
  end

  scenario 'owner confirms a booking' do
    user1 = create_user1
    user2 = create_user2
    property = Property.create(user_id: user2.id, name: 'Makers', description: '52 Commercial Place', price_per_night: 133, available_from: "2019-12-25", available_to: "2020-12-25")
    booking = Booking.create(property_id: property.id, user_id: user1.id, check_in: "2019-10-22", check_out: "2019-10-23", booking_status: 'pending')

    login('example@example.com', '123password') #user2 logs in and checks bookings

    visit'/user/profile'
    expect(page).to have_content('Pending')
    select('Confirm')
    click_button 'submit'
    visit("/user/#{user2.id}/booking/requests")
    expect(page).to have_content('Makers')
    expect(page).to have_content('Tuesday 22nd October 2019')
    expect(page).to have_content('Wednesday 23rd October 2019')
    expect(page).to have_content('Confirmed')
  end


end
