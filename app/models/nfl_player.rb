class NflPlayer
  def self.suggest_player(players)
    players_stats = NflFantasyService.retrieve_stats(players["player_1"], players["player_2"])
  end
end
