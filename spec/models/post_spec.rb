require 'rails_helper'

RSpec.describe Post, type: :model do
  let!(:user) { User.create(name: 'John', photo: 'https://example.com/photo.jpg', bio: 'A bio.') }

  it { is_expected.to belong_to(:author).class_name('User').with_foreign_key('author_id') }
  it { is_expected.to validate_numericality_of(:comment_counter).only_integer.is_greater_than_or_equal_to(0) }

  describe 'custom methods' do
    it 'returns recent comments' do
      Post.create(author: user, title: 'Test Post', text: 'This is a test post.')
      User.create(name: 'Jane', photo: 'https://example.com/jane.jpg', bio: 'Another bio.')
      # Your test logic here
    end
  end
end
