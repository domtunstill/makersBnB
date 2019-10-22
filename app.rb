ENV['RACK_ENV'] = 'development'

require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'
require './app/helpers/session_helpers'
require './app/controllers/init'


Dir[File.dirname(__FILE__) + '/app/models/*.rb'].each { |file| require file }

class MakersBnb < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  register Sinatra::Flash
  include SessionsHelper
  enable :sessions, :method_override
  set :views, 'app/views/'
  set :database_file, '../../config/database.yml'

  get '/' do
    'hello world'
  end

  get '/home' do
    @user = current_user
    erb :index
  end

  run! if app_file == $0

end
