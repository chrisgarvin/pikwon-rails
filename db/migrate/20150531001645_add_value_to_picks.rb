class AddValueToPicks < ActiveRecord::Migration
  def change
    add_column :picks, :pick_value, :integer
  end
end
