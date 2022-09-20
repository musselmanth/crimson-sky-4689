require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
  end
  describe "instance methods" do
    describe ".total_calories" do
      it 'returns the total calorie amount for the dish' do
        ingredient_1 = create(:ingredient, calories: 19)
        ingredient_2 = create(:ingredient, calories: 27)
        ingredient_3 = create(:ingredient, calories: 35)
        dish = create(:dish)
        dish.ingredients << [ingredient_1, ingredient_2, ingredient_3]

        expect(dish.total_calories).to eq(19+27+35)
      end
    end
  end
end