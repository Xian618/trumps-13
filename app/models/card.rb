class Card < ActiveRecord::Base
  belongs_to :deck
  attr_accessible :stat_values, :stat_names, :image_prefix, :interesting_facts, :name,
                  :subtitle
end
