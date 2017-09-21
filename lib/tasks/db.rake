namespace :db do
  desc "NFL"
  task :load => :environment do
    NflTeam.create_team
    NflPosition.create_position
    NflPlayer.create_player
    NflPlayerImage.new.from_csv
  end

  desc "update"
  task :update => :environment do
    NflPlayer.update_player
  end
end
