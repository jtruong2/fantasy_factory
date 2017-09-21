require 'rails_helper'
RSpec.describe "nfl player image" do
  it " retrieves players headshot" do
    VCR.use_cassette('nfl_player_image') do
      NflPlayerImage.new.from_csv

      
    end
  end
end
