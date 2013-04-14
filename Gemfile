source 'https://rubygems.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

#gem 'sqlite3'
gem 'pg'
#font-awesome-rails provides the Font-Awesome web fonts and stylesheets as a Rails engine for use with the asset pipeline.
gem "font-awesome-rails"

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'

  gem "therubyracer"
  gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
  gem "twitter-bootstrap-rails"
end

gem 'jquery-rails'


group :development, :test do
  gem 'rspec-rails'
	gem "factory_girl_rails"
	gem "capybara"
	gem "guard-rspec"
  gem 'rb-fsevent'
  gem 'ruby_gntp'
end

  gem 'paperclip' # Added to include upload images
  gem 'merit' # Add BADGES gem that is used to allocate points to users

  # Normal user registration process with Devise
  # Registration and logins with Facebook or Twitter
  # And both at the same time
  gem 'devise'
  gem 'omniauth-twitter'
  gem 'omniauth-facebook'
  gem 'twitter'
  gem 'fb_graph'
  gem 'nifty-generators'



  #CanCan is a gem that define permission for the users (admin, members, providers)
  gem 'cancan'
  gem 'role_model'


  # google maps
  gem "geocoder"
  
# To use ActiveModel has_secure_password
#gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

gem "mocha", :group => :test