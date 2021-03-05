class Alarm < ApplicationRecord
  serialize :days, Array
  validates :days, :time, presence: true
  belongs_to :user
end
