class NflRetrieve
  def self.players
    NFLFantasyService.retrieve_players["players"]
  end

  def self.positions
    positions = NFLFantasyService.retrieve_players["players"]
    positions.map do |position|
      position["position"]
    end.uniq
  end

  def self.teams
    teams = NFLFantasyService.retrieve_players["players"]
    teams.map do |team|
      team["teamAbbr"]
    end.uniq
  end
end
