require 'csv'

class NflPlayerImage
  #
  # def self.get_images
  #   from_json
  # end
  #
  # def self.from_json
  #   file = File.read('lib/assets/yahoo_player_info.json')
  #   players = JSON.parse(file)["query"]["results"]["player"]
  #   images = {}
  #   players.each do |player|
  #     images["#{player["name"]["full"]}"] = player["headshot"]["url"].split('-/')[1]
  #   end
  #   images
  # end

  def from_csv
    file = File.read('db/csvs/player_images.csv')
    CSV.parse(file).each do |image|
      NflPlayer.load_images(image[0], image[1])
    end
  end
end
