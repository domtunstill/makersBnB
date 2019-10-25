# ENV['RACK_ENV'] = 'development'

require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/partial'
require 'sinatra/flash'
require 'pony'
require './app/helpers/session_helpers'
require './app/helpers/ordinalize'
require './app/controllers/init'
require 'active_record'

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')


Dir[File.dirname(__FILE__) + '/app/models/*.rb'].each { |file| require file }


class MakersBnb < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  register Sinatra::Flash
  register Sinatra::Partial
  include SessionsHelper
  enable :sessions, :method_override
  set :partial_template_engine, :erb
  set :views, 'app/views/'
  set :database_file, '../../config/database.yml'
  set :public_folder, File.dirname(__FILE__) + '/public'

  # configure do
  #
  #   Pony.options = {
  #     :via => :smtp,
  #     :via_options => {
  #       # :address => 'smtp.sendgrid.net',
  #       :address => 'smtp.gmail.com',
  #       :port => '587',
  #       # :domain => 'myapp.com',
  #       # :user_name => ENV['SENDGRID_USERNAME'],
  #       # :password => ENV['SENDGRID_PASSWORD'],
  #       :user_name => 'themakersbnb@gmail.com',
  #       :password => '123Password',
  #       :authentication => :plain,
  #       :enable_starttls_auto => true
  #     }
  #   }
  # end

  get '/' do
    'hello world'
    redirect '/home'
  end

  get '/home' do
    @user = current_user
    erb :index
  end

  run! if app_file == $0

end
