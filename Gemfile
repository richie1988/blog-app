source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'
gem 'activesupport', '7.0.8'
gem 'bootsnap', require: false
gem 'importmap-rails', '1.2.3'
gem 'jbuilder'
gem 'pg', '1.5.4'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.8'
gem 'rubocop', '>= 1.0', '< 2.0'
gem 'sprockets-rails'
gem 'sqlite3', '~> 1.4'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw]

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '~> 6.4'
  gem 'rspec-rails'
  gem 'shoulda-matchers', '~> 4.0'
end

group :development do
  gem 'web-console', '4.2.1'
end

group :test do
  gem 'capybara', '3.39.2'
  gem 'rails-controller-testing'
  gem 'selenium-webdriver', '4.15.0'
end
