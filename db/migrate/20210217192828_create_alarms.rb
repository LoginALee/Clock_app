class CreateAlarms < ActiveRecord::Migration[6.1]
  def change
    create_table :alarms do |t|
      t.datetime :date_to_sound
      t.belongs_to :user
      t.timestamps
    end
  end
end
