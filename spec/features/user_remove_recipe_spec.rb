require 'rails_helper'

feature 'User remove recipe' do
  scenario 'successfuly' do
    cuisine = Cuisine.create(name: 'Brasileira')
    recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: 'Sobremesa',
                          cuisine: cuisine, difficulty: 'Médio',
                          cook_time: 60,
                          ingredients: 'Farinha, açucar, cenoura',
                          method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')

    recipe2 = Recipe.create(title: 'Bolo de mandioca', recipe_type: 'Sobremesa',
                          cuisine: cuisine, difficulty: 'Fácil',
                          cook_time: 20,
                          ingredients: 'Farinha, açucar, mandioca',
                          method: 'Cozinhe a mandioca, corte em pedaços pequenos, misture com o restante dos ingredientes')


    visit recipe_path(recipe)
    click_on "Excluir"

    expect(page).to_not have_css('h1', text: recipe.title)
    expect(page).to have_css('h1', text: recipe2.title)
  end

  scenario '404' do
    cuisine = Cuisine.create(name: 'Brasileira')
    recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: 'Sobremesa',
                          cuisine: cuisine, difficulty: 'Médio',
                          cook_time: 60,
                          ingredients: 'Farinha, açucar, cenoura',
                          method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')

    visit recipe_path(recipe)
    click_on "Excluir"
    visit recipe_path(recipe)

    expect(page).to have_content('404 não encontrado')
  end
end
