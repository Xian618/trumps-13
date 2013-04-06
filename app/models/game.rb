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

  def do_turn(stat_id)
    player1 = players.all[0]
    player2 = players.all[1]
    player1_card = player1.deck.cards[0]
    player2_card = player2.deck.cards[0]

    if(player1_card.is_better_than(player2_card, stat_id))
      whos_turn = 1
      player1.give_card_to(player2)
    else
      whos_turn = 2
      player2.give_card_to(player1)
    end
  end

end
