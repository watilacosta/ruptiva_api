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
# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'
# Rack middleware for blocking & throttling abusive requests
gem 'rack-attack'

group :development, :test do
  # debase is a fast implementation of the standard Ruby debugger debug.rb for
  # Ruby 2.0. It is implemented by utilizing a new Ruby TracePoint class.
  # The core component provides support that front-ends can build on.
  # It provides breakpoint handling, bindings for stack frames among other things
  gem 'debase', '~> 0.2.4.1'
  # An interface which glues ruby-debug to IDEs like Eclipse (RDT), NetBeans and RubyMine
  gem 'ruby-debug-ide', '~> 0.7.2'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  # rspec-rails brings the RSpec testing framework to Ruby on Rails as a drop-in
  # alternative to its default testing framework, Minitest
  gem 'rspec-rails', '~> 4.0.1'
end

group :development do
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'devise_token_auth'
gem 'pundit'