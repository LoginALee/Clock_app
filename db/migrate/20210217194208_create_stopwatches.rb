class CreateStopwatches < ActiveRecord::Migration[6.1]
  def change
    create_table :stopwatches do |t|
      t.text :saved_times
      t.belongs_to :user
      t.timestamps
    end
  end
end
