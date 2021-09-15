class Post < ApplicationRecord
  belongs_to :user
  belongs_to :entry
  default_scope -> { order(created_at: :desc) }
  with_options presence: true do
    validates :subject
    validates :comment
    validates :user_id
    validates :entry_id
  end
end
