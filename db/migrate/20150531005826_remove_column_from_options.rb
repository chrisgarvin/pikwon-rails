class RemoveColumnFromOptions < ActiveRecord::Migration
  def change
    remove_column :options, :option_picks, :integer
  end
end
