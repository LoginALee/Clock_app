class User < ApplicationRecord
  has_many :alarms
  has_many :stopwatches
  has_many :timezones
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
