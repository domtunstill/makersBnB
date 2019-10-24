require './app/models/property'

describe Property do
    it 'returns an array of dates to be set unavailable' do
        user = create_user2
        property = create_new_property
        Booking.create(
          property_id: property.id,
          user_id: user.id,
          check_in: "2019-12-27",
          check_out: "2019-12-29",
          booking_status: 'confirmed'
          )
        dates = property.dates_booked
        expect(dates.length).to eq(3)
        expect(dates.first.class).to eq(Date)
    end
end