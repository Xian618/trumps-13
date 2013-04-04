class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.references :deck
      t.string :name
      t.string :subtitle
      t.string :good_stats
      t.string :bad_stats
      t.string :image_prefix
      t.string :interesting_facts

      t.timestamps
    end
    add_index :cards, :deck_id
  end
end
