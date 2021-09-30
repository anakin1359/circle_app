class Post < ApplicationRecord
  belongs_to :user
  belongs_to :entry
  default_scope -> { order(created_at: :desc) }
  with_options presence: true do
    validates :subject, length: { maximum: 50 }
    validates :comment, length: { maximum: 200 }
    validates :user_id
    validates :entry_id
  end
end
