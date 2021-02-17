class CreateTimezones < ActiveRecord::Migration[6.1]
  def change
    create_table :timezones do |t|
      t.text :fav_timezones
      t.belongs_to :user
      t.timestamps
    end
  end
end
