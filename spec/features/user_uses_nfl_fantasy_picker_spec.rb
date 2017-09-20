require 'rails_helper'
RSpec.describe "User inputs two NFL player names" do
  it "returns suggested player to put on team based on projected stats" do
    VCR.use_cassette('suggest_players') do
      NflTeam.create_team
      NflPosition.create_position
      NflPlayer.create_player

      visit root_path
      fill_in :player_1, with: "tOm brAdy"
      fill_in :player_2, with: "aAron RoDgErs"
      click_on "Match up!"

      expect(current_path).to eq(nfl_player_show_path)
      expect(page).to have_content("Aaron Rodgers")
    end
  end
end
