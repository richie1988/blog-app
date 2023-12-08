require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_numericality_of(:post_counter).only_integer.is_greater_than_or_equal_to(0) }

  describe '#recent_posts' do
    it 'returns the most recent posts' do
      user = create(:user)
      older_post = create(:post, author: user, created_at: 2.days.ago)
      newer_post = create(:post, author: user, created_at: 1.day.ago)

      expect(user.recent_posts).to eq([newer_post, older_post])
    end
  end
end
