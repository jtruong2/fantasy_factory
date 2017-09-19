class NflPlayer < ApplicationRecord
  belongs_to :position
  belongs_to :team

  def self.create_or_update_player(player)
    person = NflPlayer.find_or_create_by(id: player["id"]) do |f|
      f.id = player["id"]
      f.name = player["name"]
      f.stats = "#{player["stats"]}"
      f.season_pts = player["seasonPts"]
      f.season_projected_pts = player["seasonProjectedPts"]
      f.week_pts = player["weekPts"]
      f.week_projected_pts = player["weekProjectedPts"]
    end
  end

  def self.load
    players = Nfl.retrieve_players
    players.each do |player|
      NflPlayer.create_or_update_player(player)
      byebug
    end
  end
end
