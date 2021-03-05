class ChangeColumnNameFavTimeZones < ActiveRecord::Migration[6.1]
  def change
    rename_column :timezones, :fav_timezones, :name
  end
end
