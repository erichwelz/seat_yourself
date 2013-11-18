class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.datetime :meal_time
      t.integer :party_size
      t.timestamps
    end
  end
end
