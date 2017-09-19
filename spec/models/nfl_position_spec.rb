require 'rails_helper'

RSpec.describe NflPosition, type: :model do
  it "loads database" do
    VCR.use_cassette('load_NFL_positions') do
      NflPosition.create_position
      expect(NflPosition.first["position"]).to eq("DEF")
    end
  end
end
