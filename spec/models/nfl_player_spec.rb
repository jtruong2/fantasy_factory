require 'rails_helper'

RSpec.describe NflPlayer, type: :model do
  it "loads database" do
    VCR.use_cassette('load_nfl_players') do
      NflPlayer.load

      players = NflPlayer.all
      expect(players.count).to eq(1028)
      expect(players.first["team"]).to eq("SF")
      expect(players.first["position"]).to eq("DEF")
      expect(players.first["name"]).to eq("San Francisco 49ers")
    end
  end
end
