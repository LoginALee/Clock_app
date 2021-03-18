class Stopwatch < ApplicationRecord
  validates :time, :user_id, presence: true
  serialize :laps, Array
  belongs_to :user

  after_initialize :default_value_name

  def default_value_name
    self.name ||= Date.today
  end

  def laps_print
    laps.join(', ')
  end
end
