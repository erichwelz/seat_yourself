class Removedatefromreservations < ActiveRecord::Migration
  def change
    remove_column :reservations, :meal_date
  end
end
