class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.text :comment
      t.string :image,                      null: false
      t.references :user
      t.timestamps
    end

    add_index :posts, [:user_id, :created_at]
  end
end
