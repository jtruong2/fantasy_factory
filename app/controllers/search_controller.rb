class SearchController < ApplicationController
  def show
    @player = Nfl.suggest_player(safe_params)
  end

  private

  def safe_params
    params.permit(:player_1, :player_2)
  end
end
