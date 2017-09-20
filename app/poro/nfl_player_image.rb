class NflPlayerImage

  def self.get_images
    from_json
  end

  def self.from_json
    file = File.read('lib/assets/yahoo_player_info.json')
    players = JSON.parse(file)["query"]["results"]["player"]
    images = {}
    players.each do |player|
      images["#{player["name"]["full"]}"] = player["headshot"]["url"].split('-/')[1]
    end
    images
  end
end
