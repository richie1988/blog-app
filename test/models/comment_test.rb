# # test/models/comment_test.rb
# require 'test_helper'

# class CommentTest < ActiveSupport::TestCase
#   test "comment belongs to user and post" do
#     comment = Comment.new(user: users(:one), post: posts(:one))
#     assert comment.valid?
#   end
# #
#   test "update_post_comment_counter updates post comment_counter" do
#     comment = Comment.create(user: users(:one), post: posts(:one))
#     assert_difference('comment.post.reload.comment_counter', 1) do
#       comment.update_post_comment_counter
#     end
#   end
# end
