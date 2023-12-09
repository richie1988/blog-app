source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

gem 'rubocop', '>= 1.0', '< 2.0'
gem 'rails', '~> 7.0.8'
gem 'sprockets-rails'
gem 'sqlite3', '~> 1.4'
gem 'puma', '~> 5.0'
gem 'importmap-rails', '1.2.3'
gem 'turbo-rails'
gem 'stimulus-rails'
gem 'jbuilder'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw]
gem 'bootsnap', require: false
gem 'pg', '1.5.4'  # Keep only this line for pg gem

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails'
  gem 'shoulda-matchers', '~> 4.0'
end

group :development do
  gem 'web-console', '4.2.1'
end

group :test do
  gem 'capybara', '3.39.2'
  gem 'selenium-webdriver', '4.15.0'
end
