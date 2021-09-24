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
    validates :start_time
    validates :end_time
    validates :address, length: { maximum: 137 }
    validates :user_id
  end
  validate :event_icon_size
  validate :start_end_check
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  private

  # アップロードされた画像サイズを検査
  def event_icon_size
    if event_icon.size > 1.megabytes
      errors.add(:event_icon, "should be less than 1MB")
    end
  end

  # 開始日と終了日の矛盾解消
  def start_end_check
    errors.add(:end_time, "は開始日より前の日時は指定できません。") unless start_time < end_time
  end
end
