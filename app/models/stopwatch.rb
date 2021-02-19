class Stopwatch < ApplicationRecord
  serialize :saved_times, Array
  validates :time, presence: true
end
