class Timezone < ApplicationRecord
  belongs_to :user
  validates :name, :user_id, presence: true
end
