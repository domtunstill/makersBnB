
class MakersBnb < Sinatra::Base

  get '/property/:id/booking/new' do
    @property = Property.find(params[:id])
    @dates_booked = @property.dates_booked
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

  get '/user/:id/booking/requests' do
    @user = current_user
    @properties = Property.where(user_id: @user.id)
    erb :'booking/requests'
  end

  patch '/booking/:id/confirm' do
    @booking = Booking.find(params[:id])
    @booking.update(
      booking_status: params[:confirm_select_list]
      )
    flash[:notice] = "Booking confirmed"
    redirect "/user/profile"
  end

  delete '/user/:id/booking/:book_id' do
    @user = current_user
    @booking = Booking.find(params[:book_id])
    @booking.destroy
    redirect "/user/profile"
  end

end
