class Card < ActiveRecord::Base
  belongs_to :deck
  attr_accessible :bad_stats, :good_stats, :image_prefix, :interesting_facts, :name,
                  :subtitle
end
