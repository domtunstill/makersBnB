require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'
require './helpers/session_helpers'

set :database_file, 'config/database.yml'

Dir[File.dirname(__FILE__) + '/models/*.rb'].each { |file| require file }

class MakersBnb < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  register Sinatra::Flash
  include SessionsHelper
  enable :sessions, :method_override

  get '/' do
    'hello world'
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
      user = User.create(
        name: params[:name],
        email: params[:email],
        password: params[:password]
      )
      log_in(user)
    redirect '/home'
  end

  get '/user/:id' do
    @user_id = params[:id]
    @properties = Property.where(user_id: params[:id])
    p @properties
    erb :'user/index'
  end

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

  get '/home' do
    @user = current_user
    erb :index
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    user = User.where(email: params[:email]).first
    password = params[:password]
    if user && user.authenticate(password)
      log_in(user)
      redirect '/home'
    else
      flash[:notice] = "Email or password is incorrect, try again"
      redirect '/login'
    end
  end

  post '/logout' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect '/home'
  end

  # get '/peeps' do
  #   @user = current_user
  #   @peeps = Peep.order(created_at: :desc)
  #   erb :index
  # end

  # post '/peeps/new' do
  #   @peep = Peep.create(content: params[:content], user_id: current_user.id)
  #   redirect '/peeps'
  # end

  # get '/signup' do
  #   erb :signup
  # end

  # get '/login' do
  #   erb :login
  # end

  # post '/login' do
  #   user = User.where(username: params[:username]).first
  #   password = params[:password]
  #   if user && user.authenticate(password)
  #     log_in(user)
  #     redirect '/peeps'
  #   else
  #     flash[:notice] = "Username or password is invalid"
  #     redirect '/login'
  #   end
  # end

  # post '/logout' do
  #   session.clear
  #   flash[:notice] = 'You have signed out.'
  #   redirect('/peeps')
  # end

  # post '/signup' do
  #   user = User.create(
  #     name: params[:name],
  #     username: params[:username],
  #     email: params[:email],
  #     password: params[:password]
  #   )
  #   log_in(user)
  #   redirect '/peeps'
  # end

  run! if app_file == $0

end
