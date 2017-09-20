class Analyst
  def initialize(players)
    @player_1 = titleize(players[:player_1])
    @player_2 = titleize(players[:player_2])
  end

  def suggest_player
    players = NflPlayer.get_players(@player_1, @player_2)
    players.max_by(&:week_projected_pts)
  end

private

  def titleize(name)
    name.downcase.split.map { |i| i.capitalize }.join(' ')
  end
end
