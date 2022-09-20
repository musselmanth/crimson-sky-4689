class Chef < ApplicationRecord
  validates_presence_of :name
  has_many :dishes
  has_many :ingredients, through: :dishes

  def used_ingredients
    ingredients.distinct
  end

  def most_popular_ingredients
    ingredients
      .select("ingredients.*, count(ingredients.id) as ingredient_count")
      .group('ingredients.id')
      .order(ingredient_count: :desc)
      .limit(3)
  end

end