class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many   :post
  default_scope -> { order(created_at: :desc) }
  with_options presence: true do
    validates :entry_count
    validates :entry_price
    validates :user_id
    validates :event_id
  end
end
