class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :author, foreign_key: { to_table: :users }, null: false
      t.string :title, null: false
      t.text :text
      t.integer "comments_counter", default: 0, null: false
      t.integer "posts_counter", default: 0, null: false
      t.integer "likes_counter", default: 0, null: false

      t.timestamps
    end
  end
end
