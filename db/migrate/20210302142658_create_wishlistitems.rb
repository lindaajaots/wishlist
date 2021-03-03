class CreateWishlistItems < ActiveRecord::Migration[6.1]
  def change
    create_table :WishlistItems do |t|
      t.string :name
      t.belongs_to :wishlist
      t.timestamps
    end
  end
end
