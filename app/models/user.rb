class User < ApplicationRecord
  has_many :events
  has_many :entries, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  validates :name,  presence: true, length: { maximum: 50 }
  validates :email, length: { maximum: 255 }
end
