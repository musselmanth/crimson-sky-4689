# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

chefs = FactoryBot.create_list(:chef, 8)
chefs.each do |chef|
  FactoryBot.create_list(:dish, 10, chef: chef)
  chef.dishes.each do |dish|
    dish.ingredients << FactoryBot.create_list(:ingredient, rand(5..10))
  end
end


