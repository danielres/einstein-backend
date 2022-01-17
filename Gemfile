source 'https://rubygems.org'


gem 'rails', '5.2.4.6'

gem 'rails-api', '>= 0.4.0'

gem 'rack-cors', '>= 1.0.5', require: 'rack/cors'


gem 'spring', group: :development


group :development, :test do
  gem 'sqlite3'
  gem 'pry'
end

group :production do
  gem 'pg'
end

gem 'devise', '>= 4.7.1'

gem 'thin', '>= 1.6.1'

gem 'active_model_serializers', '>= 0.9.3'

gem 'grape', '>= 1.1.0'
gem 'hashie-forbidden_attributes'

group :test do
  gem 'minitest-rails', '>= 3.0.0'
  gem 'minitest-rails-capybara', '>= 3.0.0'
  gem 'minitest-focus'
  gem 'minitest-reporters'
  gem 'database_cleaner'
  gem 'mocha'
  gem 'shoulda', '>= 3.5.0'
end

group :development do
  gem 'guard' , '>= 2.12.6' # NOTE: this is necessary in newer versions
  gem 'guard-minitest'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano', group: :development

# To use debugger
# gem 'ruby-debug19', require: 'ruby-debug'
