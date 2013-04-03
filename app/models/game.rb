class Game < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :game_id, :player1, :player2
end
