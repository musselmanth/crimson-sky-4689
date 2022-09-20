require 'rails_helper'

RSpec.describe "Chef Show Page" do
  before :each do
    @chef = create(:chef)
    @dishes = create_list(:dish, 3, chef: @chef)
    @dishes.each do |dish|
      dish.ingredients << create_list(:ingredient, 5)
    end
    visit(chef_path(@chef.id))
  end

  it 'has the chefs name' do
    expect(page).to have_content(@chef.name)
  end

  it 'has a link to the chefs unique ingredients' do
    expect(page).to have_link("View a List of Ingredients #{@chef.name} Uses")
  end

  it 'the link goes to the chefs ingredient index page' do
    click_link("View a List of Ingredients #{@chef.name} Uses")

    expect(current_path).to eq(chef_ingredients_path(@chef.id))
  end

  it 'lists the 3 most popular ingredients' do
    most_popular_ingredients = @chef.most_popular_ingredients
    expect(page).to have_content("Most Popular Ingredients In Chef #{@chef.name}'s Dishes:")
    most_popular_ingredients.each do |ingredient|
      within("li#ingredient_#{ingredient.id}") do
        expect(page).to have_content(ingredient.name)
      end
    end
  end
end