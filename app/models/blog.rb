class Blog < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  mount_uploader :image, ImageUploader
  validates :title, presence: true
  validates :title, length: { maximum: 50 }
  validates :content, presence: true
  validates :content, length: { maximum: 140 }
end
