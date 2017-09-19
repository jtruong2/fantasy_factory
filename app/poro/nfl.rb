class Nfl
  def self.retrieve_players
    players = NflFantasyService.retrieve_players
    players["players"]
  end
end
