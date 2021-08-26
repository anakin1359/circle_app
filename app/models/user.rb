class User < ApplicationRecord
  has_many :events
  has_many :entries, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  mount_uploader :user_icon, ImageUploader
  validates :name,  presence: true, length: { maximum: 50 }
  validates :email, length: { maximum: 255 }
  validate :user_icon_size
  
  private

  # アップロードされた画像サイズを検査
  def user_icon_size
    if user_icon.size > 1.megabytes
      errors.add(:user_icon, "should be less than 1MB")
    end
  end
end
