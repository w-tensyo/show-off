class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :content
      t.references :user, foreign_key: true
      t.references :receive_user, foreign_key:{to_table: :users}

      t.timestamps
    end
  end
end
