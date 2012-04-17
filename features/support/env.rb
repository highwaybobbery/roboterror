require "rubygems"
require "spork"

require 'cucumber/rails'
Spork.prefork do
 load "#{Rails.root}/db/seeds.rb"

  Capybara.default_selector = :css
  ActionController::Base.allow_rescue = false

  begin
    DatabaseCleaner.strategy = :transaction
  rescue NameError
    raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
  end

  Cucumber::Rails::Database.javascript_strategy = :truncation
  World FactoryGirl::Syntax::Methods
  require "factory_girl/step_definitions"
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}
end

Spork.each_run do
end

