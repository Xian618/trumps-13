class Player < ActiveRecord::Base
  belongs_to :game
  has_one :deck
  attr_accessible :name

  def give_card_to(player2)
  	player2.deck.cards << player2.deck.cards.shift
    player2.deck.cards << deck.cards.shift
  end

end
