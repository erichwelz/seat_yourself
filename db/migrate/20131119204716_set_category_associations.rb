class SetCategoryAssociations < ActiveRecord::Migration
    def change
      create_table :categories_restaurants do |t|
      t.belongs_to :category
      t.belongs_to :restaurant
    end
  end

end
