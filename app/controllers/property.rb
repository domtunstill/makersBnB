
class MakersBnb < Sinatra::Base


  get '/property/all' do
    @properties = Property.all
    erb :'property/all'
  end

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

  get '/property/:id' do
    @property = Property.find(params[:id])
    erb :'property/index'
  end

  get '/property/all/available' do
    @check_in = params[:check_in]
    p "checkin: " + @check_in
    @check_out = params[:check_out]
    p "checkout: " + @check_out
    @properties = Property.where("available_from <= :check_in AND available_to >= :check_out", {check_in: params[:check_in], check_out: params[:check_out]})
    erb :'property/available'
  end

end
