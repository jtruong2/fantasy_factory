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
