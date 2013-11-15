class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :neighbourhood
      t.text :summary
      t.integer :seats
      t.integer :hours_open
      t.integer :hours_close

      t.timestamps
    end
  end
end
