source 'https://rubygems.org'

gem 'rails', '4.2.0'
#Bug with font-awesome, sprockets-rails v2.2.4 fixes this
gem 'sprockets-rails', :require => 'sprockets/railtie'
gem 'slim-rails'
gem 'jquery-rails'
gem 'unicorn-rails'
gem 'pg'
gem 'role_model'
gem 'font-awesome-rails'
gem 'bootstrap-sass', '~> 3.3.3'
gem 'sass-rails', '~> 5.0'
gem 'sass-globbing'
gem 'compass-rails'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'parse-ruby-client'
gem 'geokit-rails'
gem 'enumerize'
gem 'rails_admin'

#Authentication and authorisation
gem 'sorcery'
gem 'cancancan'
#gem 'pundit'

#Social Media API Wrapper
gem 'fb_graph'
gem 'twitter'
gem 'google_plus'

#Mail Chimp API Wrapper
gem 'gibbon'

#Image Uploaders
gem 'carrierwave'
gem 'mini_magick'
gem 'fog'

group :development do
  gem 'pry'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'guard-rspec', require: false
  gem 'pry-rails'
  gem 'quiet_assets'
  gem 'spring'
  gem 'heroku_san'
  gem 'rb-readline'
  gem 'rb-inotify', require: false
  gem 'rb-fsevent', require: false
  gem 'rb-fchange', require: false
end

group :development, :test do
  gem 'dotenv-rails'
  gem 'factory_girl_rails'
  gem 'rspec-rails'
end

group :test do
  gem 'codeclimate-test-reporter', require: false
  gem 'capybara'
  gem 'database_cleaner'
  gem 'faker'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
  gem 'webmock'
end
