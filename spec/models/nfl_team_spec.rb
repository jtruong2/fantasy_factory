require 'rails_helper'

RSpec.describe NflTeam, type: :model do
  it "loads database" do
    VCR.use_cassette('load_NFL_teams') do
      NflTeam.create_team

      expect(NflTeam.all.count).to eq(33)
    end
  end
end
