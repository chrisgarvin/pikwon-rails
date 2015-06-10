class AddSkipToPicks < ActiveRecord::Migration
  def change
    add_column :picks, :skip, :boolean
  end
end
