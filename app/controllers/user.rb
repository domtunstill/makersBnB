
class MakersBnb < Sinatra::Base

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

  get '/user/:id' do
    @user = current_user
    @properties = Property.where(user_id: @user.id)
    erb :'user/index'
  end

  post '/logout' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect '/home'
  end

end
