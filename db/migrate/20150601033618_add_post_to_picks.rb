class AddPostToPicks < ActiveRecord::Migration
  def change
    add_reference :picks, :post, index: true
    add_foreign_key :picks, :posts
  end
end
