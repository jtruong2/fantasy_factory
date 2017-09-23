class Nfl::NflPlayerController < ApplicationController
  def show
    @player = Analyst.new(safe_params).suggest_player
  end

  private

  def safe_params
    params.permit(:player_1, :player_2)
  end
end
