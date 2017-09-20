class NflPosition < ApplicationRecord
  has_many :nfl_players
  validates :position, uniqueness: true

  def self.create_position
    positions = NflRetrieve.positions
    positions.each do |position|
      create!(position: position)
    end
  end
end
