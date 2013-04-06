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
      
      card = Card.new
      card.name = row['name']
      card.image_prefix = row['prefix']
      card.subtitle = stat_id.to_s
      get_stats(stat_id, card, row)

      create_card_if_new(card)
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

  def get_stats(stat_id, card, row)
    if (stat_id == 0)
    	get_bad_stats(card, row)
    else
    	# add more stat types
    end
  end

  def get_bad_stats(card, row)
  	names_list = Array.new
  	names_list[0] = "Teenage Pregnancy"
    names_list[1] = "Chief Salary"
  	names_list[2] = "Publicity Spending"
  	names_list[3] = "Rate of ABH"
  	names_list[4] = "School Exclusions"
  	names_list[5] = "Food Hygeine"
  	card.stat_names = names_list.join(",")

    stat_values = Array.new
    stat_values[0] = row["pregnancy"]
    stat_values[1] = row["salary"]
    stat_values[2] = row["publicity"]
    stat_values[3] = row["ABH"]
    stat_values[4] = row["expulsion"]
    stat_values[5] = row["food"]
    card.stat_values = stat_values.join(",")
  end

  def is_better_than(card2, stat_id)
    card1_stats = @stat_values.split(",")
    card2_stats = card2.stat_values.split(",")

    return (card1_stats[stat_id] > card2_stats[stat_id])
  end
end
