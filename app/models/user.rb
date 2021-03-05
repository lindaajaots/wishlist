class User < ApplicationRecord
has_many :posts, dependent: :destroy

  validates :name, presence: true
  EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: EMAIL_FORMAT }, uniqueness: true
  validates :password_digest, presence: true

  before_save { self.email = email.downcase }

end
