class Group < ApplicationRecord
  validates :title, presence: true
  validates :icon, presence: true

  belongs_to :user
  has_many :transactions
end
