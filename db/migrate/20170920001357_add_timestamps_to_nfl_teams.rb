class AddTimestampsToNflTeams < ActiveRecord::Migration[5.1]
  def change
    add_column :nfl_teams, :created_at, :datetime
    add_column :nfl_teams, :updated_at, :datetime
  end
end
