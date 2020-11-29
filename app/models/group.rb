class Group < ApplicationRecord
  validates :title, presence: true
  validates :icon, presence: true

  belongs_to :user
  has_many :transactions, dependent: :destroy

  mount_uploader :icon, ImageUploader
end
