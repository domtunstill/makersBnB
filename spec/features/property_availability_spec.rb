feature 'Property availability' do

    scenario 'look for properties available when check-in date is on a booked day' do
        user1 = create_user1
        user2 = create_user2
        property = Property.create(user_id: user2.id, name: 'Makers', description: '52 Commercial Place', price_per_night: 133, available_from: "2019-09-25", available_to: "2020-12-25")
        booking = Booking.create(property_id: property.id, user_id: user1.id, check_in: "2019-10-22", check_out: "2019-10-24", booking_status: 'confirmed')

        login('example@example.com', '123password') #user2 logs in and checks bookings

        visit'/property/all'

        fill_in'check_in', with: "2019-10-23"
        fill_in'check_out', with: "2019-10-25"
        click_button'Submit'

        expect(page).not_to have_content('52 Commercial Place')
  end

    scenario 'look for available properties where check-in date = a bookings check-out date' do
        user1 = create_user1
        user2 = create_user2
        property = Property.create(user_id: user2.id, name: 'Makers', description: '52 Commercial Place', price_per_night: 133, available_from: "2019-09-25", available_to: "2020-12-25")
        booking = Booking.create(property_id: property.id, user_id: user1.id, check_in: "2019-10-22", check_out: "2019-10-23", booking_status: 'confirmed')

        login('example@example.com', '123password') #user2 logs in and checks bookings

        visit'/property/all'
        fill_in'check_in', with: "2019-10-23"
        fill_in'check_out', with: "2019-10-25"
        click_button'Submit'
        expect(page).to have_content('52 Commercial Place')
  end

  scenario 'look for available properties where check-out date = a bookings check-in date' do
    user1 = create_user1
    user2 = create_user2
    property = Property.create(user_id: user2.id, name: 'Makers', description: '52 Commercial Place', price_per_night: 133, available_from: "2019-09-25", available_to: "2020-12-25")
    booking = Booking.create(property_id: property.id, user_id: user1.id, check_in: "2019-10-22", check_out: "2019-10-23", booking_status: 'confirmed')

    login('example@example.com', '123password') #user2 logs in and checks bookings

    visit'/property/all'
    fill_in'check_in', with: "2019-10-21"
    fill_in'check_out', with: "2019-10-22"
    click_button'Submit'
    expect(page).to have_content('52 Commercial Place')
end
end