class Event < ApplicationRecord
  belongs_to :admin
  default_scope -> { order(created_at: :desc) }
  validates :admin_id, presence: true
  validates :title, presence: true, length: { maximum: 50 }
end
