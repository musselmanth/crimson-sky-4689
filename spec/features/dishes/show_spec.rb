require 'rails_helper'

RSpec.describe 'Dish Show Page', type: :feature do
  before :each do
    @dish = create(:dish)
    @dish.ingredients << create_list(:ingredient, 5)

    visit(dish_path(@dish.id))
  end

  it 'shows the name and description of the dish' do
    expect(page).to have_content(@dish.name)
    expect(page).to have_content(@dish.description)
  end

  it 'shows the name of the chef' do
    expect(page).to have_content("Chef: #{@dish.chef.name}")
  end

  it 'lists the ingredients' do
    expect(page).to have_content("Ingredients:")

    @dish.ingredients.each do |ingredient|
      within("li#ingredient_#{ingredient.id}") do
        expect(page).to have_content(ingredient.name)
      end
    end
  end

  it 'lists the total calories' do
    expect(page).to have_content("Total Calories: #{@dish.total_calories}")
  end
end