class NFL
  def self.retrieve_players
    NFLFantasyService.retrieve_players["players"]
  end

  def self.retrieve_positions
    positions = NFLFantasyService.retrieve_players["players"]
    positions.map do |position|
      position["position"]
    end.uniq
  end

  def self.retrieve_teams
    teams = NFLFantasyService.retrieve_players["players"]
    a = teams.map do |team|
      team["teamAbbr"]
    end.uniq
  end
end
