class CreateOptionsPosts < ActiveRecord::Migration
  def change
    create_table :options_posts do |t|
      t.integer :option_id
      t.integer :post_id
    end
  end
end
