# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
json_customers = JSON.parse(File.read('db/seeds/customers.json'))

json_customers.each do |customer|
  Customer.create!(customer)
end

json_movies = JSON.parse(File.read('db/seeds/movies.json'))

json_movies.each do |movie|
  new = Movie.create!(movie)
  new.available_inventory = new.inventory
  new.save
end
