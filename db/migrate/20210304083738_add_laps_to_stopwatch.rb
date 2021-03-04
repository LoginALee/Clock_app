class AddLapsToStopwatch < ActiveRecord::Migration[6.1]
  def change
    add_column :stopwatches, :laps, :string
  end
end
