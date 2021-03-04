class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :alarms
  has_many :stopwatches
  has_many :timezones
  has_one_attached :avatar
  validates :avatar, content_type: ['image/jpeg', 'image/png']
end
