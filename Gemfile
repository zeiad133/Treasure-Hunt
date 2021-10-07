# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

ruby '2.6.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.3.18', '< 0.6.0'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors', require: 'rack/cors'
gem 'bootsnap', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # A Ruby static code analyzer, based on the community Ruby style guide.
  gem 'rubocop', '0.63'
  gem 'rubocop-rspec'
end

group :development, :test do
  # gem 'thor'
  gem 'sshkit'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'rswag-specs'
  gem 'timecop'
  gem 'shrine-memory'
  gem 'factory_bot_rails', '~> 4.0'
  gem 'shoulda-matchers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
# active model serliazers gem to serialize model objects into json
gem 'active_model_serializers', '~> 0.10.0'
# Seamless JWT authentication for Rails API
gem 'shrine', '~> 3.0'
gem 'aws-sdk-s3'
gem 'rswag-api'
gem 'rswag-ui'
gem 'image_processing'
gem 'mini_magick', '>= 4.3.5'
gem 'dotenv-rails'
gem 'devise_token_auth'
gem 'redis-namespace'
gem 'sidekiq'
gem 'geokit-rails'
gem 'will_paginate', '~> 3.1.0'
gem 'lograge'
gem 'rubyzip', '~> 1.1.0'
gem 'axlsx', '2.1.0.pre'
gem 'axlsx_rails'
gem 'bugsnag', '~> 6.11'
gem 'interactor'
gem 'activerecord-import', '~> 1.0.8'
