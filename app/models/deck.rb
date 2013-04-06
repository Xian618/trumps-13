class Deck < ActiveRecord::Base
  belongs_to :player
  has_many :cards

  def self.shuffle_into_decks(stat_type, player1, player2)
    cards = Card.find_all_by_subtitle(stat_type).shuffle
    if(cards.size.odd?)
    	cards = cards.first(cards.size - 1)
    end

    deck1 = Deck.new
    deck2 = Deck.new

    cards.each_slice(2) do |a, b|
    	deck1.cards << a
    	deck2.cards << b
    end

    deck1.save
    deck2.save

    player1.deck = deck1
    player2.deck = deck2
  end
end
