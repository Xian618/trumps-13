class Player < ActiveRecord::Base
  belongs_to :game
  has_one :deck
  attr_accessible :name

  def give_card_to(winner)
    winner_previouscard = winner.deck.cards.all.shift
    loser_previouscard = deck.cards.all.shift

    Rails.logger.info(winner_previouscard.name)
    Rails.logger.info('asiodjasodn')
    Rails.logger.info(loser_previouscard.name)

  	winner.deck.cards << winner_previouscard
    winner.deck.cards << loser_previouscard
    
    Rails.logger.info(winner.deck.cards.first.name)
    Rails.logger.info(deck.cards.first.name)
    
  end

end
