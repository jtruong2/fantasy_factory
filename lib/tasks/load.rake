namespace :load do
  desc "NFL"
  task :nfl => :environment do
    NflTeam.create_team
    NflPosition.create_position
    NflPlayer.create_player
  end
end
