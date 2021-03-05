class ChangeAlarmFields < ActiveRecord::Migration[6.1]
  def change
    change_column :alarms, :date_to_sound, :string
    rename_column :alarms, :date_to_sound, :days
    add_column :alarms, :time, :time
  end
end
