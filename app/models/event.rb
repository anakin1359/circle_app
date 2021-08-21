class Event < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  with_options presence: true do
    validates :user_id
    validates :title, length: { maximum: 50 }
    validates :introduction, length: { maximum: 300 }
    validates :entry_count
    validates :event_price
    validates :start_date
    validates :end_date
    validates :address, length: { maximum: 137 }
  end
end
