class TurnUpdate

  include AttributeHashHelper

  attr_accessor :stat_picked, :you_win_hand, :you_win_game

  def send_to_player(game_id, player_id)
 	queue_name = 'presence-'+game_id.to_s+'-'+player_id.to_s
 	Pusher.trigger(queue_name, 'turnupdate', to_hash())
  end

end