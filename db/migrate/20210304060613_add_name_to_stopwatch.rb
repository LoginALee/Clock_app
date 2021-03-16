class AddNameToStopwatch < ActiveRecord::Migration[6.1]
  def change
    add_column :stopwatches, :name, :string
  end
end
