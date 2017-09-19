class YahooFantasyService
  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
    @conn = Faraday.new("https://fantasysports.yahooapis.com/") do |faraday|
      faraday.headers["Authorization"]
    end
  end

  def self.retrieve_stats(player_1, player_2)
    new(player_1, player_2).retrieve_stats
  end

  def retrieve_stats
    @conn.get("")
  end
end
