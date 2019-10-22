
class MakersBnb < Sinatra::Base

  get '/user/:id/property/new' do
    @user_id = params[:id]
    erb :'property/new'
  end

  post '/user/:id/property' do
    Property.create(user_id: params[:id], name: params[:name], description: params[:description], price_per_night: params[:price])
    redirect "/user/#{params[:id]}"
  end

  get '/user/:id/property/:prop_id/update' do
    @user_id = params[:id]
    @property_id = params[:prop_id]
    erb :'property/update'
  end

  patch '/user/:id/property/:prop_id' do
    @property = Property.where(id: params[:prop_id]).first
    @property.update(name: params[:name], description: params[:description], price_per_night: params[:price])
    redirect "/user/#{params[:id]}"
  end

  delete '/user/:id/property/:prop_id' do
    @property = Property.where(id: params[:prop_id]).first
    @property.destroy
    redirect "/user/#{params[:id]}"
  end

end
