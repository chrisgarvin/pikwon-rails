class CreatePicks < ActiveRecord::Migration
  def change
    create_table :picks do |t|
      t.references :user, index: true
      t.references :option, index: true

      t.timestamps null: false
    end
    add_foreign_key :picks, :users
    add_foreign_key :picks, :options
  end
end
