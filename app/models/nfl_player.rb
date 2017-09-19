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

  private

  def self.find_position(player)
    NflPosition.find_by(position: player["position"]).id
  end

  def self.find_team(player)
    NflTeam.find_by(team: player["teamAbbr"]).id
  end
end
