# app/controllers/application_controller.rb

class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :devise_controller?

  private

  def after_sign_in_path_for(resource)
    user_path(resource)
  end
end
