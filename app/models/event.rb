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
  validate :event_icon_size
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  private

  # アップロードされた画像サイズを検査
  def event_icon_size
    if event_icon.size > 1.megabytes
      errors.add(:event_icon, "should be less than 1MB")
    end
  end
end
