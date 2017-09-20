class AddTimestampsToNflPositions < ActiveRecord::Migration[5.1]
  def change
    add_column :nfl_positions, :created_at, :datetime, null: false
    add_column :nfl_positions, :updated_at, :datetime, null: false
  end
end
