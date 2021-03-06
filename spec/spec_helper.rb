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
require_relative './web_helper'

# ENV['RACK_ENV'] = 'test'
# ENV['ENVIRONMENT'] = 'test'

Capybara.app = MakersBnb

# Load rake file for database tasks
# rake = Rake.application
# rake.load_rakefile

RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end
end
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
