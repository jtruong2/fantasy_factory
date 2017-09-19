require 'rails_helper'
RSpec.describe "User inputs two nfl player names" do
  it "returns suggested player to put on team based on projected stats" do

    visit root_path
    fill_in :player_1, with: "Tom Brady"
    fill_in :player_2, with: "Matt Ryan"
    click_on "Match up!"

    expect(current_path).to eq(nfl_player_show_path)
    expect(page).to have_content("Tom Brady")
  end
end
