source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'bundler', '2.4.22'
gem 'bootsnap', require: false
gem 'importmap-rails', '1.2.3'
gem 'jbuilder', '2.11.5'
gem 'pg', '1.5.4'
gem 'puma', '5.6.7'
gem 'rails', '7.0.8'
gem 'rubocop', '1.58.0', require: false
gem 'sprockets-rails', '3.4.2'
gem 'sqlite3', '~> 1.4'
gem 'stimulus-rails', '1.3.0'
gem 'turbo-rails', '1.5.0'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw]


group :development do
  gem 'web-console', '4.2.1'
end

group :test do
  gem 'capybara', '3.39.2'
  gem 'selenium-webdriver', '4.15.0'
  gem 'shoulda-matchers', require: false
end

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec'
  gem 'rspec-rails'
  gem 'rubocop-rails'
end
