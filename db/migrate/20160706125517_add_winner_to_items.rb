class AddWinnerToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :winner_id, :integer
  end
end
