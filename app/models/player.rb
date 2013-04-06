class Player < ActiveRecord::Base
  belongs_to :game
  has_one :deck
  attr_accessible :name
end
