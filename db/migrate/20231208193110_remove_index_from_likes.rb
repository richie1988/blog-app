class RemoveIndexFromLikes < ActiveRecord::Migration[7.0]
  def up
    execute "DROP INDEX IF EXISTS index_likes_on_user_and_post;"
  end

  def down
    # Use "DROP INDEX" instead of "CREATE INDEX"
    execute "DROP INDEX IF EXISTS index_likes_on_user_and_post;"
  end
end
