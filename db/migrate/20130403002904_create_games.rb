class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :game_id
      t.string	:player1
      t.string	:player2

      t.timestamps
    end
  end
end
