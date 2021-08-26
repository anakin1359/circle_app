class Event < ApplicationRecord
  belongs_to :user
  has_many :entries, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  mount_uploader :event_icon, ImageUploader
  with_options presence: true do
    validates :title, length: { maximum: 50 }
    validates :introduction, length: { maximum: 300 }
    validates :entry_count
    validates :event_price
    validates :start_date
    validates :end_date
    validates :address, length: { maximum: 137 }
    validates :user_id
  end
end
