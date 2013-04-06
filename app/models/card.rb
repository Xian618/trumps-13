class Card < ActiveRecord::Base
  require 'csv'    

  belongs_to :deck
  attr_accessible :stat_values, :stat_names, :image_prefix, 
                  :interesting_facts, :name, :subtitle

  def build_deck(stat_id)
    csv_text = File.read('list_of_boroughs.csv')
    csv = CSV.parse(csv_text, :headers => true)

    csv.each do |row|
      row = row.to_hash.with_indifferent_access
      
      @card = Card.new
      @card.name = row['name']
      @card.image_prefix = row['prefix']
      @card.subtitle = stat_id.to_s
      get_stats(stat_id, @card)

      create_card_if_new(@card)
    end
  end

  def create_card_if_new(card)
    cards = Card.find_all_by_name_and_subtitle(card.name, card.subtitle)

    if (cards.size > 0) 
      logger.info "found existing card"
    else
      card.save
    end
  end

  def get_stats(stat_id, card)
    if (stat_id == 0)
    	get_bad_stats(card)
    else
    	# add more stat types
    end
  end

  def get_bad_stats(card)
  	names_list = Array.new
  	names_list[0] = "Teenage Pregnancy"
    names_list[1] = "Local Authority Top Salary"
  	names_list[2] = "Garbage Rate"
  	names_list[3] = "Stat Number 4"
  	names_list[4] = "Stat Number 5"
  	names_list[5] = "Stat Number 6"
  	card.stat_names = names_list.join(",")

    stat_values = Array.new
    stat_values[0] = rand(10)
    stat_values[1] = rand(10)
    stat_values[2] = rand(10)
    stat_values[3] = rand(10)
    stat_values[4] = rand(10)
    stat_values[5] = rand(10)
    card.stat_values = stat_values.join(",")
  end

  def is_better_than(card2, stat_id)
    card1_stats = @stat_values.split(",")
    card2_stats = card2.stat_values.split(",")

    return (card1_stats[stat_id] > card2_stats[stat_id])
  end
end
