# app/controllers/posts_controller.rb
class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.paginate(page: params[:page], per_page: 3)
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find_by(id: params[:id])

    if @post.nil?
      # Handle the case when the post is not found, e.g., redirect to an error page
      redirect_to user_posts_path(@user), alert: 'Post not found.'
      return
    end

    @comments = @post.comments.includes(:user).paginate(page: params[:page], per_page: 5)

    respond_to do |format|
      format.html { render template: 'posts/show' }
    end
  end

  def new
    @post = @current_user.posts.build
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @post = @current_user.posts.build(post_params)
    if @post.save
      redirect_to user_posts_path(@current_user), notice: 'Post created successfully.'
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
