
class MakersBnb < Sinatra::Base


  get '/property/all' do
    @user = current_user
    @properties = Property.all
    @date_current = Date.today.to_s
    @date_tomorrow = (Date.tomorrow).to_s
    @date_year = (Date.today + 365).to_s
    flash[:notice] = "No dates selected"
    erb :'property/all'
  end

  get '/user/:id/property/new' do
    @user = current_user
    erb :'property/new'
  end

  get '/user/:id/property/owned' do
    @user = current_user
    @properties = Property.where(user_id: @user.id)
    erb :'property/owned'
  end

  post '/user/:id/property' do
    Property.create(
    user_id: current_user.id,
    name: params[:name],
    description: params[:description],
    price_per_night: params[:price].to_i,
    available_from: params[:start_date],
    available_to: params[:end_date],
    image: params[:image]
    )

    Email.send_create_space_email(current_user)
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
    Email.send_update_space_email(current_user)
    redirect "/user/profile"
  end

  delete '/user/:id/property/:prop_id' do
    @property = Property.where(id: params[:prop_id]).first
    @property.destroy
    redirect "/user/profile"
  end

  get '/property/:id' do
    @user = current_user
    @property = Property.find(params[:id])
    @dates_booked = @property.dates_booked_strings
    erb :'property/index'
  end

  get '/property/all/available' do
    @check_in = params[:check_in]
    @check_out = params[:check_out]
    if @check_in.empty? || @check_out.empty?
      flash[:notice] = "No dates selected"
      redirect '/property/all' 
    end
    properties = Property.where("available_from <= :check_in AND available_to >= :check_out", {check_in: @check_in, check_out: @check_out})
    @properties = Property.booked_check(properties, @check_in, @check_out)
    erb :'property/available'
  end

end
