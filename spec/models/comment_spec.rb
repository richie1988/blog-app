require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#update_post_comment_counter' do
    it 'updates the post comment counter' do
      post = create(:post)
      comment = create(:comment, post:)

      expect { comment.update_post_comment_counter }.to change { post.reload.comment_counter }.by(1)
    end
  end
end
