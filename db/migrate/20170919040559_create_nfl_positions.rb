class CreateNflPositions < ActiveRecord::Migration[5.1]
  def change
    create_table :nfl_positions do |t|
      t.string :position
    end
  end
end
