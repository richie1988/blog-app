# app/models/user.rb

class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :comments
  has_one :like  # Change this line to has_one instead of has_many

  validates :name, presence: true
  validates :post_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
