class Game < ActiveRecord::Base
  attr_accessible :stat_type, :whos_turn

  has_many :players
end
