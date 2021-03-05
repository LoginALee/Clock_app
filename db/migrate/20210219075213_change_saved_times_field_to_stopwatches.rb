class ChangeSavedTimesFieldToStopwatches < ActiveRecord::Migration[6.1]
  def change
    change_column :stopwatches, :saved_times, :string
    rename_column :stopwatches, :saved_times, :time
  end
end
