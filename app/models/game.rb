class Game < ActiveRecord::Base
  attr_accessible :stat_type, :whos_turn
  has_many :players

  def build_game_objects()
    @stat_type = 0
    @whos_turn = 1

    deck1 = Deck.new
    deck2 = Deck.new

    Deck.shuffle_into_decks(@stat_type.to_s, deck1, deck2)

    deck1.save
    deck2.save

    players[0].deck = deck1
    players[1].deck = deck2
  end
end
