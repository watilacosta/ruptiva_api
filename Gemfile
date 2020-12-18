# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false
# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making
# cross-origin AJAX possible
gem 'rack-cors'
# Rack middleware for blocking & throttling abusive requests
gem 'rack-attack'

group :development, :test do
  # debase is a fast implementation of the standard Ruby debugger debug.rb
  gem 'debase', '~> 0.2.4.1'
  # An interface which glues ruby-debug to IDEs like Eclipse (RDT), NetBeans and RubyMine
  gem 'ruby-debug-ide', '~> 0.7.2'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  # Clean your ActiveRecord databases with Database Cleaner
  gem 'database_cleaner-active_record'
  # factory_bot is a fixtures replacement with a straightforward definition
  # syntax, support for multiple build strategies (saved instances, unsaved
  # instances, attribute hashes, and stubbed objects)
  gem 'factory_bot_rails'
  # This gem is a port of Perl's Data::Faker library that generates fake data.
  gem 'faker'
  # rspec-rails brings the RSpec testing framework to Ruby on Rails as a drop-in
  # alternative to its default testing framework, Minitest
  gem 'rspec-rails', '~> 4.0.1'
  # Simple one-liner tests for common Rails functionality
  gem 'shoulda-matchers', '~> 4.0'
  # About Set of matchers and helpers to allow you test your APIs responses like a pro
  gem 'rspec-json_expectations'
end

group :test do
  # A set of RSpec matchers for testing Pundit authorisation policies.
  gem 'pundit-matchers', '~> 1.6.0'
  # Validate your JSON APIs
  gem 'json_matchers'
end

group :development do
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the
  # background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Annotate Rails classes with schema and routes info
  gem 'annotate'
  # This gem implements the rspec command for Spring.
  gem 'spring-commands-rspec'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'devise_token_auth'
gem 'devise'
gem 'pundit'
# ActiveModel::Serializer implementation and Rails hooks
# JSON API
gem 'active_model_serializers', '~> 0.10.0'
# Documentation api
gem 'rswag'
# When your app is using Paranoia, calling destroy on an ActiveRecord object
# doesn't actually destroy the database record, but just hides it.
gem "paranoia", "~> 2.2"
# Translations for the devise gem
gem 'devise-i18n'
