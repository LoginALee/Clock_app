class AddDefaultValueTimeZoneUser < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :time_zone, :string, default: 'Central Time (US & Canada)'
  end
end
