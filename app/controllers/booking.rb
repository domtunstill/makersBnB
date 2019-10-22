
class MakersBnb < Sinatra::Base

  get '/property/:id/booking/new' do
    @property_id = params[:id]
    @property = Property.find(params[:id])
    flash[:notice] = "Booking confirmed"

    erb :'booking/new'
  end

  post '/property/:id/booking' do
    Booking.create(property_id: params[:id], user_id: current_user.id, check_in: params[:check_in],check_out: params[:check_out])

    redirect "/user/#{current_user.id}"
  end
end
