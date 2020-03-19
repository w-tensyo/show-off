class RenameCommntColumnToGears < ActiveRecord::Migration[5.0]
  def change
    rename_column :gears, :equ_commnt, :equ_comment
  end
end
