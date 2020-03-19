class CreateGears < ActiveRecord::Migration[5.0]
  def change
    create_table :gears do |t|
      t.string :equipment
      t.text :comment
      t.references :post

      t.timestamps
    end
  end
end
