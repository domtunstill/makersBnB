
class MakersBnb < Sinatra::Base

  get '/property/:id/booking/new' do
    @property_id = params[:id]
    @property = Property.find(params[:id])

    erb :'booking/new'
  end
end
