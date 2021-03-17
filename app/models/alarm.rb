class Alarm < ApplicationRecord
  serialize :days, Array
  validates :days, :time, :user_id, presence: true
  belongs_to :user
end
