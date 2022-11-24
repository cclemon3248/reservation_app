class Reserve < ApplicationRecord
  belongs_to :room
  validates :start,    presence: true
  validates :end, presence: true
  validates :price,   presence: true
end
