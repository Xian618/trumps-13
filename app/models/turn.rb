class Turn
  include AttributeHashHelper

  attr_accessor :player_numcards, :opponent_numcards, :player_turn, 
                  :card_name, :card_subtitle, :card_image_prefix, 
                  :card_stat_names, :card_stats, :player_name,
                  :opponent_name

  def initialize(game, player_index, opponent_index)
    @player_name = game.players[player_index].name
    @opponent_name = game.players[opponent_index].name
  	@player_numcards = game.players[player_index].deck.cards.size
  	@opponent_numcards = game.players[opponent_index].deck.cards.size
    populate_card_data(game.players[player_index].deck.cards.all.first)

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
    @card_stat_names = card.stat_names.split(",")
    @card_stats = card.stat_values.split(",")
  end

  def send_to_player(game_id, player_id)
    queue_name = 'presence-'+game_id.to_s+'-'+player_id.to_s
    Pusher.trigger(queue_name, 'turn', to_hash())
  end
end
