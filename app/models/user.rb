class User < ApplicationRecord
  before_validation { email.downcase! }
  mount_uploader :image, ImageUploader
  has_secure_password
  has_many :rooms
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :current_password, presence: true, on: [:update]
  validates :name,    presence: true, on: [:update]
  validates :image,   presence: true, on: [:update]
  validates :content, presence: true, on: [:update]
end
