class Room < ApplicationRecord
  belongs_to :user
  has_many :reserves
  validates :name,    presence: true
  validates :content, presence: true
  validates :price,   presence: true
  validates :address, presence: true
  validates :image,   presence: true
  mount_uploader :image, ImageUploader
end
