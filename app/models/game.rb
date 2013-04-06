class Game < ActiveRecord::Base
  attr_accessible :stat_type, :whos_turn
  has_many :players

  def build_game_objects()
    @stat_type = 0
    @whos_turn = 1

    deck1 = Deck.new
    deck2 = Deck.new

    logger.info(players.size)

    Deck.shuffle_into_decks(@stat_type.to_s, 
    						players.all[0],
    						players.all[1])

    save
  end
end
