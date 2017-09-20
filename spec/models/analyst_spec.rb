require 'rails_helper'

RSpec.describe Analyst, type: :model do
  it "returns player with best projected_week_pts" do
    VCR.use_cassette("analyst") do
      NflTeam.create_team
      NflPosition.create_position
      NflPlayer.create_player
      
      players = {:player_1 => "Antonio Brown", :player_2 => "Julio Jones"}

      superior_player = Analyst.new(players).suggest_player

      expect(superior_player.name).to eq("Julio Jones")
    end
  end
end
