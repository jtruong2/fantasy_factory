class NFLFantasyService
  def self.retrieve_players
    conn = Faraday.get("http://api.fantasy.NFL.com/v1/players/stats")
    JSON.parse(conn.body)
  end
end
