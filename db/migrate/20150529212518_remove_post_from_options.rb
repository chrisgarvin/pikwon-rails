class RemovePostFromOptions < ActiveRecord::Migration
  def change
    remove_column :options, :post_id, :integer
  end
end
