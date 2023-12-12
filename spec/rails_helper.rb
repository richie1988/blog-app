# This file is copied to spec/ when you run 'rails generate rspec:install'
# rails_helper.rb or spec_helper.rb
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'

# Add the following lines to properly configure FactoryBot
require 'factory_bot'
FactoryBot.definition_file_paths << File.join(File.dirname(__FILE__), 'factories')
FactoryBot.find_definitions

# ... (existing configurations)

RSpec.configure do |config_outer|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config_outer.fixture_path = Rails.root.join('spec/fixtures')
  config_outer.order = 'default'

  # ... (existing configurations)

  Shoulda::Matchers.configure do |config_inner|
    config_inner.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end

  # ... (existing configurations)

  config_outer.use_transactional_fixtures = true

  # ... (existing configurations)

  config_outer.infer_spec_type_from_file_location!

  # ... (existing configurations)

  config_outer.filter_rails_from_backtrace!
end
