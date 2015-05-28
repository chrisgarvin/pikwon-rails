class AddColumnToOptions < ActiveRecord::Migration
  def change
    add_reference :options, :post, index: true
    add_foreign_key :options, :posts
  end
end
