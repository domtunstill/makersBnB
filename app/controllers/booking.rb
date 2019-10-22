
class MakersBnb < Sinatra::Base

  get '/property/:id/booking/new' do
    @property_id = params[:id]
    @property = Property.find(params[:id])
    flash[:notice] = "Booking confirmed"

    erb :'booking/new'
  end

  post '/property/:id/booking' do
    redirect "/user/#{current_user.id}"
  end
end
