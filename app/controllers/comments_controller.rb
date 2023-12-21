# app/controllers/comments_controller.rb
class CommentsController < ApplicationController
  before_action :set_post, only: %i[new create]

  def new
    @user = current_user
    @comment = @post.comments.build
  end

  # app/controllers/comments_controller.rb
  def create
    @comment = current_user.comments.build(comment_params.merge(post: @post))
    if @comment.save
      redirect_to user_post_path(@post.author, @post), notice: 'Comment created successfully.'
    else
      render partial: 'comments/new', status: :unprocessable_entity
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: 'Post not found.'
  end

  def comment_params
    params.require(:comment).permit(:text)
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize! :destroy, @comment

    @comment.destroy
    redirect_to user_post_path(@comment.post.author, @comment.post), notice: 'Comment deleted successfully.'
  end
end
