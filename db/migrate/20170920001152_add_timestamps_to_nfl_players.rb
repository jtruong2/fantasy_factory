class AddTimestampsToNflPlayers < ActiveRecord::Migration[5.1]
  def change
    add_column :nfl_players, :created_at, :datetime, null: false
    add_column :nfl_players, :updated_at, :datetime, null: false
  end
end
