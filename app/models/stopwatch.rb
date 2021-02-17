class Stopwatch < ApplicationRecord
  serialize :saved_times, Array
end
