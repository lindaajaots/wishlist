class Wishlist < ApplicationRecord
  has_many :things
  belongs_to :user

end
