class AddDeckToPlayer < ActiveRecord::Migration
  def change
  	change_table :players do |t|
  		t.references :deck
  	end
  end
end
