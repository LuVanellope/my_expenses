require 'spec_helper'
require 'faker'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
ActiveRecord::Migration.maintain_test_schema!
require 'rspec/rails'
require 'capybara/rspec'

RSpec.configure do |config| 
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

 config.include Capybara::DSL

 Capybara.register_driver :selenium_chrome do |app|
   Capybara::Selenium::Driver.new(app, browser: :chrome)
 end

 Capybara.javascript_driver = :selenium_chrome

end 




