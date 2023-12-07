class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id', dependent: :destroy, inverse_of: :author
  has_many :comments, dependent: :destroy, inverse_of: :user
  has_many :likes, dependent: :destroy, inverse_of: :user

  validates :name, presence: true
  validates :post_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
