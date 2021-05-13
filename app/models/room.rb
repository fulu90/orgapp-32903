class Room < ApplicationRecord
  has_many :room_users, dependent: :destroy
  has_many :users, through: :room_users
  has_many :comments, dependent: :destroy

  validates :tname, presence: true
end
