
class MakersBnb < Sinatra::Base

  get '/user/:id/property/new' do
    @user = current_user
    erb :'property/new'
  end

  post '/user/:id/property' do
    Property.create(
    user_id: current_user.id, 
    name: params[:name], 
    description: params[:description], 
    price_per_night: params[:price].to_i, 
    available_from: params[:start_date], 
    available_to: params[:end_date]
    )
    redirect "/user/profile"
  end

  get '/user/:id/property/:prop_id/update' do
    @user = current_user
    @property = Property.where(id: params[:prop_id]).first
    erb :'property/update'
  end

  patch '/user/:id/property/:prop_id' do
    @property = Property.where(id: params[:prop_id]).first
    @property.update(
      user_id: current_user.id, 
      name: params[:name], 
      description: params[:description], 
      price_per_night: params[:price].to_i, 
      available_from: params[:start_date], 
      available_to: params[:end_date]
      )
    redirect "/user/profile"
  end

  delete '/user/:id/property/:prop_id' do
    @property = Property.where(id: params[:prop_id]).first
    @property.destroy
    redirect "/user/profile"
  end

end
