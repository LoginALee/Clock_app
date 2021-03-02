class Alarm < ApplicationRecord
  serialize :days, Array
  validates :days, :time, presence: true
  belongs_to :user

  def time_format
    time.strftime('%H:%M')
  end
end
