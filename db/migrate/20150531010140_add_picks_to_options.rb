class AddPicksToOptions < ActiveRecord::Migration
  def change
    add_column :options, :option_picks, :integer, :default => 0
  end
end
