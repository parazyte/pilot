source 'https://rubygems.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg'

# For haml views
gem 'haml-rails'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'

  # For JST hamlc templates
  gem 'haml_coffee_assets'
  gem 'execjs'
end

group :development, :test do
  # Specs
  gem 'rspec-rails', '~> 3.0.0.beta'
  # For javascript unit testing
  gem 'jasmine-rails'
  # For running tests in the browser
  gem 'jasminerice'
end

group :test do
  gem "factory_girl_rails", "~> 4.0"
  gem 'timecop'
end

gem 'jquery-rails'
gem 'awesome_print'
gem 'debugger'
gem 'bootstrap-sass', '~> 3.0.3.0'

group :development do
  gem 'rails_layout'
end