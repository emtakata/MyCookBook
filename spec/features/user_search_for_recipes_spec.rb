require 'rails_helper'

feature 'User search for recipes' do
  scenario 'from home' do
    cuisine = Cuisine.create(name: 'Capixaba')
    recipe = Recipe.create(
      title: 'Muqueca', recipe_type: 'Tipo tipo', difficulty: 'Fácil',
      cook_time: 30, ingredients: 'Leite de coco, Cebola, tomate, salsinha, tainha',
      method: 'Junte tudo em fogo brando e espere', cuisine: cuisine
    )
    Recipe.create(
      title: 'Muleca', recipe_type: 'Tipo tipo', difficulty: 'Fácil',
      cook_time: 30, ingredients: 'Leite de coco, Cebola, tomate, salsinha, tainha',
      method: 'Junte tudo em fogo brando e espere', cuisine: cuisine
    )

    visit root_path
    fill_in 'Buscar receita', with: 'Muqueca'
    click_on 'Buscar'

    expect(page).to have_css('h1', text: 'Muqueca')
  end

  scenario 'from cuisine' do
    cuisine = Cuisine.create(name: 'Capixaba')
    recipe = Recipe.create(
      title: 'Muqueca', recipe_type: 'Tipo tipo', difficulty: 'Fácil',
      cook_time: 30, ingredients: 'Leite de coco, Cebola, tomate, salsinha, tainha',
      method: 'Junte tudo em fogo brando e espere', cuisine: cuisine
    )
    Recipe.create(
      title: 'Muleca', recipe_type: 'Tipo tipo', difficulty: 'Fácil',
      cook_time: 30, ingredients: 'Leite de coco, Cebola, tomate, salsinha, tainha',
      method: 'Junte tudo em fogo brando e espere', cuisine: cuisine
    )

    visit cuisines_path(cuisine)

    expect(page).to have_css('p', text: 'Buscar receita')
  end

  scenario 'from recipes' do
    cuisine = Cuisine.create(name: 'Capixaba')
    recipe = Recipe.create(
      title: 'Muqueca', recipe_type: 'Tipo tipo', difficulty: 'Fácil',
      cook_time: 30, ingredients: 'Leite de coco, Cebola, tomate, salsinha, tainha',
      method: 'Junte tudo em fogo brando e espere', cuisine: cuisine
    )
    Recipe.create(
      title: 'Muleca', recipe_type: 'Tipo tipo', difficulty: 'Fácil',
      cook_time: 30, ingredients: 'Leite de coco, Cebola, tomate, salsinha, tainha',
      method: 'Junte tudo em fogo brando e espere', cuisine: cuisine
    )

    visit recipes_path(recipe)

    expect(page).to have_css('p', text: 'Buscar receita')
  end
end
