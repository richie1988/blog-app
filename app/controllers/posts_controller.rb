class PostsController < ApplicationController
  def index
    @placeholder_text = 'Posts of the user'
  end

  def show
    @placeholder_text = 'Post with the user id'
  end
end
