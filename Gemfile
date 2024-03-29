# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.0.4'
gem 'mail', '~> 2.8', '>= 2.8.1'

# Grape related gems
gem 'grape', '~> 1.6', '>= 1.6.2'

gem 'simple_command', '~> 1.0', '>= 1.0.1'
gem 'grape-entity', '~> 0.10.2'
gem 'jwt', '~> 2.5'
gem 'figaro', '~> 1.2'
gem 'aws-sdk-ses', '~> 1.49'
gem 'tilt', '~> 2.0', '>= 2.0.11'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
gem 'bcrypt', '~> 3.1', '>= 3.1.18'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

group :development, :test do
  gem 'grape_on_rails_routes', '~> 0.3.2'
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-rails'
end

group :development do
  gem 'rubocop', '~> 1.38'
  gem 'rubocop-rails', '~> 2.17', '>= 2.17.2'
  gem 'rubocop-rspec', '~> 2.15'
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end
