class CreateNflTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :nfl_teams do |t|
      t.string :team
    end
  end
end
