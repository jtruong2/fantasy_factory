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
end
