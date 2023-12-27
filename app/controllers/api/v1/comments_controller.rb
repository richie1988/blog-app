# app/controllers/api/v1/comments_controller.rb
module Api
  module V1
    class CommentsController < ApplicationController
      before_action :set_post
      before_action :set_comment, only: [:show]

      def index
        @comments = @post.comments.includes(:user)
        respond_to do |format|
          format.html { render partial: 'comments/index' }
          format.json { render json: @comments }
        end
      end

      def show
        respond_to do |format|
          format.html { render partial: 'comments/show' }
          format.json { render json: @comment }
        end
      end

      def create
        @comment = current_user.comments.build(comment_params.merge(post: @post))
        if @comment.save
          respond_to do |format|
            format.html { redirect_to user_post_path(@post.author, @post), notice: 'Comment created successfully.' }
            format.json { render json: @comment, status: :created }
          end
        else
          respond_to do |format|
            format.html { render partial: 'comments/new', status: :unprocessable_entity }
            format.json { render json: @comment.errors, status: :unprocessable_entity }
          end
        end
      end

      private

      def set_post
        @post = Post.find(params[:post_id])
      rescue ActiveRecord::RecordNotFound
        respond_to do |format|
          format.html { redirect_to root_path, alert: 'Post not found.' }
          format.json { render json: { error: 'Post not found.' }, status: :not_found }
        end
      end

      def set_comment
        @comment = @post.comments.includes(:user).find_by(id: params[:id])

        return unless @comment.nil?

        # Handle the case when the comment is not found
        respond_to do |format|
          format.html { redirect_to user_post_path(@post.author, @post), alert: 'Comment not found.' }
          format.json { render json: { error: 'Comment not found.' }, status: :not_found }
        end
      end

      def comment_params
        params.require(:comment).permit(:text)
      end
    end
  end
end
