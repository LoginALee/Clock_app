class Stopwatch < ApplicationRecord
  validates :time, presence: true
  belongs_to :user
  serialize :laps, Array

  after_initialize :default_value_name

  def default_value_name
    self.name ||= Date.today
  end

  def laps_print
    laps.join(', ')
  end
end
