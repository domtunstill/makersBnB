feature 'bookings' do
  scenario 'user looks at a property to book' do
    user = create_user1
    create_user2
    property = Property.create(user_id: user.id, name: 'Makers', description: '52 Commercial Place', price_per_night: 133)

    visit "/property/#{property.id}/bookings/new"
    expect(page).to have_content("Makers", "52 Commercial Place")
    expect(page).to have_button("request_booking")

  end
end
