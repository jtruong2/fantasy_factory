require 'open-uri'
require 'nokogiri'

class Scraper
  def self.nfl_headshots(name, url)
    page = Nokogiri::HTML(open(url))
    photo = page.css('.player-photo').first.children[1].attributes["src"].value
    pass_to_model(name, photo)
  end

  def self.pass_to_model(name, photo)
    NflPlayer.load_images(name, photo)
  end
end
# CSV.open("player_images.csv", "wb") do |csv|
#   csv << ["name", "image"]
#   file = File.read('/Users/jimmytruong/turing/3module/projects/fantasy_picker/db/csvs/final.csv')
#   images = CSV.parse(file).each do |image|
#     photo = Nokogiri::HTML(open(image[1])).css('.player-photo').first.children[1].attributes["src"].value
#     csv << [image[0], photo]
#   end
# end
