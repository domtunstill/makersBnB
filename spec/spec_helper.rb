ENV['RACK_ENV'] = 'test' 

require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
                                                                 SimpleCov::Formatter::Console,
                                                                 SimpleCov::Formatter::HTMLFormatter
                                                               ])
SimpleCov.start

require 'capybara'
require 'rspec'
require 'capybara/rspec'
require 'active_record'
require 'sinatra/activerecord'
require File.join(File.dirname(__FILE__), '..', 'app.rb')
require_relative './setup_test_database'

# ENV['ENVIRONMENT'] = 'test'
# ENV['RAILS_ENV'] = 'test'

Capybara.app = MakersBnb

# Load rake file for database tasks
# rake = Rake.application
# rake.load_rakefile
RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
