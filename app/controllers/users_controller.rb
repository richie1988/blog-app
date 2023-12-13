class UsersController < ApplicationController
  def index
    @users = User.all
    puts "DEBUG: #{@users.inspect}"
  end

  def show
    @user = User.find(params[:id])
  end
end
