
class MakersBnb < Sinatra::Base

  get '/property/:id/booking/new' do
    @property = Property.find(params[:id])

    erb :'booking/new'
  end

  post '/property/:id/booking' do
    Booking.create(
      property_id: params[:id],
      user_id: current_user.id,
      check_in: params[:check_in],
      check_out: params[:check_out],
      booking_status: 'pending'
      )
      Email.guest_book_space_email(current_user)
      landlord = Property.find(params[:id]).find_landlord
      p landlord
      Email.property_booking_request_email(landlord)
    redirect "/user/profile"
  end

end
