require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_length_of(:title).is_at_most(250) }
  it { should validate_numericality_of(:comment_counter).only_integer.is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:likes_counter).only_integer.is_greater_than_or_equal_to(0) }

  describe '#update_user_post_counter' do
    it 'updates the user post counter' do
      user = create(:user)
      post = create(:post, author: user)

      expect { post.update_user_post_counter }.to change { user.reload.post_counter }.by(1)
    end
  end

  describe '#recent_comments' do
    it 'returns the most recent comments' do
      post = create(:post)
      older_comment = create(:comment, post:, created_at: 2.days.ago)
      newer_comment = create(:comment, post:, created_at: 1.day.ago)

      expect(post.recent_comments).to eq([newer_comment, older_comment])
    end
  end
end
