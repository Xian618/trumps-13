class Deck < ActiveRecord::Base
  belongs_to :player
  has_many :cards
end
