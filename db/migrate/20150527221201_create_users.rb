class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :handle
      t.string :fname
      t.string :lname
      t.string :email
      t.string :password
      t.boolean :privacy

      t.timestamps null: false
    end
  end
end
