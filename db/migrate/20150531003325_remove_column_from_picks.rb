class RemoveColumnFromPicks < ActiveRecord::Migration
  def change
    remove_column :picks, :pick_value, :integer
  end
end
