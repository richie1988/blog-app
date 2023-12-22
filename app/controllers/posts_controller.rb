class PostsController < ApplicationController
  before_action :set_post, only: %i[show destroy]
  load_and_authorize_resource

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments).paginate(page: params[:page], per_page: 3)
  end
  # def show
  #   @user = User.find(params[:user_id])
  #   @post = Post.includes(:comments).find_by(id: params[:id])

  #   if @post.nil?
  #     # Handle the case when the post is not found
  #     redirect_to user_posts_path(@user), alert: 'Post not found.'
  #     return
  #   end
  def show
    @user = User.find(params[:user_id])
    @post = Post.includes(:comments).find_by(id: params[:id])

    if @post.nil?
      # Handle the case when the post is not found
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

  # app/controllers/posts_controller.rb
  def destroy
    @post.destroy
    redirect_to user_posts_path(@user), notice: 'Post was successfully deleted.'
  end

  private

  def set_post
    @user = User.find(params[:user_id])
    @post = Post.includes(:comments).find_by(id: params[:id])

    return unless @post.nil?

    # Handle the case when the post is not found
    redirect_to user_posts_path(@user), alert: 'Post not found.'
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
