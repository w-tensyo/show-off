class AddTxetToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :text, :text
  end
end
