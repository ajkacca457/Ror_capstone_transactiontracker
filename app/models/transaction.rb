class Transaction < ApplicationRecord
validates :title, length: { minimum: 10 }
validates :amount, presence: true

belongs_to :user
belongs_to :group, optional: true

scope :grouped, -> { where.not(group: [nil]).order('created_at DESC') }
scope :non_grouped, -> { where(group: [nil]).order('created_at DESC') }

end
