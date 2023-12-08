class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_post_comment_counter
    post.update(comment_counter: post.comments.count)
  end
end
