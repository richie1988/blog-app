require 'rails_helper'

RSpec.describe Like, type: :model do
  describe '#update_post_likes_counter' do
    it 'updates the post likes counter' do
      post = create(:post)
      like = create(:like, post:)

      expect { like.update_post_likes_counter }.to change { post.reload.likes_counter }.by(1)
    end
  end
end
