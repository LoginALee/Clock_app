class Timezone < ApplicationRecord
  belongs_to :user
  validates :fav_timezones, presence: true
end
