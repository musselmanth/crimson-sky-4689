require 'rails_helper'

RSpec.describe "Chef Ingredients Index Page" do
  before :each do
    @chef = create(:chef)
    @dishes = create_list(:dish, 3, chef: @chef)
    @dishes.each do |dish|
      dish.ingredients << create_list(:ingredient, 5)
    end
    visit(chef_ingredients_path(@chef.id))
  end

  it 'lists the unique ingredients the chef uses' do
    unique_ingredients = @chef.used_ingredients
    expect(page).to have_content("Chef #{@chef.name}'s Used Ingredients:")
    unique_ingredients.each do |ingredient|
      within("li#ingredient_#{ingredient.id}") do
        expect(page).to have_content(ingredient.name)
      end
    end
  end
end