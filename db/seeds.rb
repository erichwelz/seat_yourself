# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities => City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Restaurant.create([
#   {name: 'Crocodile Rock'},
#   {address: '22 Duncan St.'},
#   {neighbourhood: 'Fashion District'},
#   {summary: 'Cougar Lounge'},
#   {seats: 100},
#   {hours_open: 18},
#   {hours_close: 21}]
# )

# Categories.create!(
#   :category_name => 'Pescetarian',
#   )

# Categories.create!(
#   :category_name => 'Italian'
#   )

# Categories.create!(
#   :category_name => 'Tacos'
#   )

# Restaurant.create!(
#   :name => 'Crocodile Rock',
#   :address  =>'22 Duncan Street',
#   :neighbourhood => 'Fashion District',
#   :summary => 'Cougar Lounge',
#   :seats => 10,
#   :hours_open =>18,
#   :hours_close => 21
#   )


# Restaurant.create!(
#   :name => 'Irish Pub',
#   :address  =>'Queen Street',
#   :neighbourhood => 'Fashion District',
#   :summary => 'Hipster Lounge',
#   :seats => 10,
#   :hours_open =>18,
#   :hours_close => 21
# )

Restaurant.create!(
  :name => 'Taco Bell',
  :address  =>'King Street',
  :neighbourhood => 'Fashion District',
  :summary => 'Mexican Restaurant',
  :seats => 100,
  :hours_open =>11,
  :hours_close => 20
)


# Categories.create!(
#   :category_name => 'Italian',
#   :restaurant_id => 1,
#   :category_id => 1
#   )

# Categories.create!(
#   :category_name => 'Pescetarian',
#   :restaurant_id => 2,
#   :category_id => 2
#   )




