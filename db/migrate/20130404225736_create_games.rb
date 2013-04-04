class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :stat_type
      t.integer :whos_turn

      t.timestamps
    end
  end
end
