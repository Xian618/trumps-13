class Turn
  include AttributeHashHelper

  attr_accessible :player_numcards, :opponent_numcards, :player_turn, 
                  :card_name, :card_subtitle, :card_image_prefix, 
                  :card_stat_names, :card_stats

  def initialize(game, player_index, opponent_index)
  	@player_numcards = game.players[player_index].deck.size()
  	@opponent_numcards = game.players[opponent_index].deck.size()
    populate_card_data(game.players[player_index].deck[0])

  	if(player_index == game.whos_turn)
  		player_turn = true
  	else
  		player_turn = false
  	end
  end

  def populate_card_data(card)
    @card_name = card.name
    @card_subtitle = card.subtitle
    @card_image_prefix = card.image_prefix
    @card_stat_names = card.stat_names
    @card_stats = card.stat_values
  end

  def send_to_player(game_id, player_id)
    Pusher.trigger('presence-'+game_id+'-'+player_id, 'turn', to_hash())
  def
end
