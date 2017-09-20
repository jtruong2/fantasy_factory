class NflPlayer < ApplicationRecord
  belongs_to :nfl_position
  belongs_to :nfl_team


  def self.create_player
    players = NFL.retrieve_players
    players.each do |player|
      load_player(player)
    end
  end

  def self.load_player(player)
    create!(
      :id                   => player["id"],
      :name                 => player["name"],
      :stats                =>"#{player["stats"]}",
      :season_pts           => player["seasonPts"],
      :season_projected_pts => player["seasonProjectedPts"],
      :week_pts             => player["weekPts"],
      :week_projected_pts   => player["weekProjectedPts"],
      :nfl_position_id      => find_position(player),
      :nfl_team_id          => find_team(player)
    )
  end

  def self.update_player
    players = NFL.retrieve_players
    players.each do |attributes|
      player = NflPlayer.find(attributes["id"].to_i)
      update_attr(player, attributes)
      player.touch
    end
  end

  def self.update_attr(player, attributes)
    player.update_attributes(
      :stats => attributes["stats"],
      :season_pts => attributes["seasonPts"],
      :season_projected_pts => attributes["seasonProjectedPts"],
      :week_pts => attributes["weekPts"],
      :week_projected_pts => attributes["weekProjectedPts"],
      :nfl_team_id => find_team(attributes),
    )
  end

  private

  def self.find_position(player)
    NflPosition.find_by(position: player["position"]).id
  end

  def self.find_team(player)
    NflTeam.find_by(team: player["teamAbbr"]).id
  end
end
