class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :event
  with_options presence: true do
    validates :entry_count
    validates :entry_price
    validates :user_id
    validates :event_id
  end
end
