require 'faker'

FactoryBot.define do
  factory :chef do
    name { Faker::Name.name }
  end

  factory :dish do
    chef
    name { Faker::Food.dish }
    description { Faker::Food.description }
  end

  factory :dish_ingredient do
    dish
    ingredient
  end

  factory :ingredient do
    name { Faker::Food.ingredient }
    calories { rand(50..500) }
  end
end