class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    if params[:id] == 'sign_out'
      # Handle the logout case, maybe redirect to the root_path
      redirect_to root_path
    else
      @user = User.find(params[:id])
      @user_posts = @user.posts.paginate(page: params[:page], per_page: 3)
    end
  rescue ActiveRecord::RecordNotFound
    # Handle the case when the user is not found
    redirect_to root_path, alert: 'User not found.'
  end
end
