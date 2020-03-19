class RenameCommentColumnToGears < ActiveRecord::Migration[5.0]
  def change
    rename_column :gears, :comment, :equ_commnt
  end
end
