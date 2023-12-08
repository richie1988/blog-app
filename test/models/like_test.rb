# # test/models/like_test.rb
# require 'test_helper'

# class LikeTest < ActiveSupport::TestCase
#   def setup
#     @user = users(:one)  # Assuming you have a fixture for users with a record named 'one'
#     @post = posts(:one)  # Assuming you have a fixture for posts with a record named 'one'
#     @like = Like.new(user: @user, post: @post)
#   end

#   test 'should be valid' do
#     assert @like.valid?
#   end

#   test 'should require a user_id' do
#     @like.user_id = nil
#     assert_not @like.valid?
#   end

#   test 'should require a post_id' do
#     @like.post_id = nil
#     assert_not @like.valid?
#   end

#   test 'should update post likes_counter after save' do
#     assert_difference '@post.reload.likes_counter', 1 do
#       @like.save
#     end
#   end

#   test 'should update post likes_counter after destroy' do
#     @like.save
#     assert_difference '@post.reload.likes_counter', -1 do
#       @like.destroy
#     end
#   end
# end
