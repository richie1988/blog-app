class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @user_posts = @user.posts.paginate(page: params[:page], per_page: 3)
  end
end
