require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
    it {should have_many(:ingredients).through(:dishes)}
  end
  describe "instance methods" do
    describe ".used_ingredients" do
      it 'returns a list of dintinct ingredients the chef uses' do
        chef = create(:chef)
        dishes = create_list(:dish, 3, chef: chef)
        ingredients = create_list(:ingredient, 5)
        dishes[0].ingredients << [ingredients[0], ingredients[2]]
        dishes[1].ingredients << [ingredients[2], ingredients[4]]
        dishes[1].ingredients << [ingredients[4], ingredients[2]]

        expect(chef.used_ingredients).to match_array([ingredients[0], ingredients[2], ingredients[4]])
      end
    end

    describe '.most_popular_ingredients' do
      it 'returns the three most popular ingredients' do
        chef = create(:chef)
        dishes = create_list(:dish, 4, chef: chef)
        ingredients = create_list(:ingredient, 4)

        dishes[0].ingredients << [ingredients[2], ingredients[3], ingredients[0], ingredients[1]]
        dishes[1].ingredients << [ingredients[2], ingredients[3], ingredients[0]]
        dishes[2].ingredients << [ingredients[2], ingredients[3]]
        dishes[3].ingredients << [ingredients[2]]

        expect(chef.most_popular_ingredients).to eq([ingredients[2], ingredients[3], ingredients[0]])
      end
    end
  end
end