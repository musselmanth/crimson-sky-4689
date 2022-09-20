require 'rails_helper'

RSpec.describe "Chef Show Page" do
  before :each do
    @chef = create(:chef)
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
end