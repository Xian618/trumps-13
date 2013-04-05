class RenameCardStatsColumns < ActiveRecord::Migration
  def change
  	rename_column :cards, :good_stats, :stat_names
  	rename_column :cards, :bad_stats, :stat_values
  end
end
