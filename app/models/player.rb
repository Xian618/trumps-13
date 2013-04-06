class Player < ActiveRecord::Base
  belongs_to :game
  has_one :deck
  attr_accessible :name

  def give_card_to(player2)
    player2_previouscard = player2.deck.cards.all.shift
    player1_previouscard = deck.cards.all.shift

  	player2.deck.cards << player2_previouscard
    player2.deck.cards << player1_previouscard
  end

end
