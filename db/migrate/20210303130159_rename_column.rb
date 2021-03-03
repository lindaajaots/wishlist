class RenameColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :wishlists, :item, :name
  end
end
