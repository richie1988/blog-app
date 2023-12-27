# app/controllers/api/v1/posts_controller.rb
module Api
  module V1
    class PostsController < ApplicationController
      before_action :set_user
      before_action :set_post, only: [:show]

      def index
        @posts = @user.posts.includes(:comments)
        respond_to do |format|
          format.html { render template: 'posts/index' }
          format.json { render json: @posts }
        end
      end

      def show
        respond_to do |format|
          format.html { render template: 'posts/show' }
          format.json { render json: @post }
        end
      end

      private

      def set_user
        @user = User.find(params[:user_id])
      end

      def set_post
        @post = Post.includes(:comments).find_by(id: params[:id])

        return unless @post.nil?

        # Handle the case when the post is not found
        respond_to do |format|
          format.html { redirect_to user_posts_path(@user), alert: 'Post not found.' }
          format.json { render json: { error: 'Post not found.' }, status: :not_found }
        end
      end
    end
  end
end
