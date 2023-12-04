class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :post_id
      t.timestamps
    end

    add_foreign_key :likes, :users, column: :user_id
    add_foreign_key :likes, :posts, column: :post_id

    # Remove the automatic creation of created_at and updated_at columns
    change_table :likes do |t|
      t.remove :created_at
      t.remove :updated_at
    end
  end
end
