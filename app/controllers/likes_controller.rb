# app/controllers/likes_controller.rb
class LikesController < ApplicationController
  before_action :set_user
  before_action :set_post

  def create
    @like = @post.likes.build(user: @user)
    if @like.save
      redirect_to user_post_path(@user, @post), notice: 'Like added successfully.'
    else
      render 'likes/error'
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
