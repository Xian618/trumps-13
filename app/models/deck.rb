class Deck < ActiveRecord::Base
  belongs_to :player
  has_many :cards

  def self.shuffle_into_decks(stat_type, deck1, deck2)
    cards = Card.find_all_by_subtitle(stat_type).shuffle
    if(cards.size.odd?)
    	cards = cards.first(cards.size - 1)
    end

    cards.each_slice(2) do |a, b|
    	deck1.cards << a
    	deck2.cards << b
    end
  end
end
