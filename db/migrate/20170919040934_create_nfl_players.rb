class CreateNflPlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :nfl_players do |t|
      t.string :name
      t.references :position, foreign_key: true
      t.references :team, foreign_key: true
      t.string :stats
      t.integer :season_pts
      t.integer :season_projected_pts
      t.integer :week_pts
      t.integer :week_projected_pts
      t.string :image
    end
  end
end
