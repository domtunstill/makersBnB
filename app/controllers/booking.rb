
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

end
