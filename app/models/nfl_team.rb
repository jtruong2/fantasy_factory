class NflTeam < ApplicationRecord
  has_many :nfl_players
  validates :team, uniqueness: true


  def self.create_team
    teams = NflRetrieve.teams
    teams.each do |team|
      create!(team: team)
    end
  end
end
