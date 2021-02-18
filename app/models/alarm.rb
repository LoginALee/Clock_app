class Alarm < ApplicationRecord
  serialize :days, Array
  belongs_to :user
end
