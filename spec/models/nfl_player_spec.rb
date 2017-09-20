require 'rails_helper'

RSpec.describe NflPlayer, type: :model do
  it "loads database" do
    VCR.use_cassette('load_NFL_players') do
      NflTeam.create_team
      NflPosition.create_position
      NflPlayer.create_player

      players = NflPlayer.all
      expect(players.count).to eq(1036)
      expect(players.first["name"]).to eq("Matt Forte")
    end
  end

  it "updates database" do
    VCR.use_cassette('updates_database') do
      NflTeam.create_team
      NflPosition.create_position
      NflPlayer.create_player

      player = NflPlayer.first

      expect(player.name).to eq("Matt Forte")
      expect(player.stats).to eq("{\"1\"=>\"2\", \"13\"=>\"15\", \"14\"=>\"69\", \"20\"=>\"7\", \"21\"=>\"58\"}")
      expect(player.season_pts).to eq(12)
      expect(player.season_projected_pts).to eq(147)
      expect(player.week_pts).to eq(0)
      expect(player.nfl_team["team"]).to eq("NYJ")

      attributes = {"stats" => "fake stats",
                    "seasonPts" => 20,
                    "seasonProjectedPts" => 200,
                    "weekPts" => 5,
                    "weekProjectedPts" => 100,
                    "teamAbbr" => "NYJ"}

      NflPlayer.update_attr(player, attributes)

      updated_player = NflPlayer.find(player.id)
      
      expect(updated_player.name).to eq("Matt Forte")
      expect(updated_player.stats).to eq(attributes["stats"])
      expect(updated_player.season_pts).to eq(attributes["seasonPts"])
      expect(updated_player.season_projected_pts).to eq(attributes["seasonProjectedPts"])
      expect(updated_player.week_pts).to eq(attributes["weekPts"])
      expect(updated_player.nfl_team["team"]).to eq("NYJ")
    end
  end
end
