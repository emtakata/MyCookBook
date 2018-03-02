require 'rails_helper'

feature 'User view last six recipes' do
  scenario 'from home page' do
    # cria os dados necessários previamente
    cuisine = Cuisine.create(name: 'Brasileira')
#    recipe_type = RecipeType.create(name: 'Sobremesa')
#    another_recipe_type = RecipeType.create(name: 'Entrada')

    recipe1 = Recipe.create(title: 'Receita 1', recipe_type: 'Sobremesa',
                           cuisine: cuisine, difficulty: 'Médio',
                           cook_time: 60,
                           ingredients: 'Farinha, açucar, cenoura',
                           method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')

    recipe2 = Recipe.create(title: 'Receita 2', recipe_type: 'Entrada',
                           cuisine: cuisine, difficulty: 'Facil',
                           cook_time: 60,
                           ingredients: 'Cenoura e legumes',
                           method: 'Cozinhe a cenoura, misture com os legumes')

    recipe3 = Recipe.create(title: 'Receita 3', recipe_type: 'Sobremesa',
                            cuisine: cuisine, difficulty: 'Facil',
                            cook_time: 60,
                            ingredients: 'Farinha, fermento, ovos, leite',
                            method: 'Misture tudo e asse por 50 minutos')

    recipe4 = Recipe.create(title: 'Receita 4', recipe_type: 'Entrada',
                            cuisine: cuisine, difficulty: 'Facil',
                            cook_time: 60,
                            ingredients: 'Trigo para kibe, tomate, cebola, alface, pepino',
                            method: 'Picar os legumes, juntar e temperar a gosto')

    recipe5 = Recipe.create(title: 'Receita 5', recipe_type: 'Principal',
                            cuisine: cuisine, difficulty: 'Facil',
                            cook_time: 60,
                            ingredients: 'Pão sírio, rosbife, presunto, queijo, alface, tomate',
                            method: 'Picar os legues, juntar e temperar a gosto')

    recipe6 = Recipe.create(title: 'Receita 6', recipe_type: 'Principal',
                            cuisine: cuisine, difficulty: 'Facil',
                            cook_time: 60,
                            ingredients: 'Pão sírio, rosbife, presunto, queijo, alface, tomate',
                            method: 'Picar os legues, juntar e temperar a gosto')

    recipe7 = Recipe.create(title: 'Receita 7', recipe_type: 'Principal',
                            cuisine: cuisine, difficulty: 'Facil',
                            cook_time: 60,
                            ingredients: 'Pão sírio, rosbife, presunto, queijo, alface, tomate',
                            method: 'Picar os legues, juntar e temperar a gosto')

    recipe8 = Recipe.create(title: 'Receita 8', recipe_type: 'Principal',
                            cuisine: cuisine, difficulty: 'Facil',
                            cook_time: 60,
                            ingredients: 'Pão sírio, rosbife, presunto, queijo, alface, tomate',
                            method: 'Picar os legues, juntar e temperar a gosto')

    visit root_path

    expect(page).to have_css('h1', text: recipe8.title)
    expect(page).to have_css('h1', text: recipe7.title)
    expect(page).to have_css('h1', text: recipe6.title)
    expect(page).to have_css('h1', text: recipe5.title)
    expect(page).to have_css('h1', text: recipe4.title)
    expect(page).to have_css('h1', text: recipe3.title)
    expect(page).to_not have_css('h1', text: recipe2.title)
    expect(page).to_not have_css('h1', text: recipe1.title)
  end

  scenario 'see all recipes' do
    cuisine = Cuisine.create(name: 'Brasileira')
#    recipe_type = RecipeType.create(name: 'Sobremesa')
#    another_recipe_type = RecipeType.create(name: 'Entrada')

    recipe1 = Recipe.create(title: 'Receita 1', recipe_type: 'Sobremesa',
                           cuisine: cuisine, difficulty: 'Médio',
                           cook_time: 60,
                           ingredients: 'Farinha, açucar, cenoura',
                           method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')

    recipe2 = Recipe.create(title: 'Receita 2', recipe_type: 'Entrada',
                           cuisine: cuisine, difficulty: 'Facil',
                           cook_time: 60,
                           ingredients: 'Cenoura e legumes',
                           method: 'Cozinhe a cenoura, misture com os legumes')

    recipe3 = Recipe.create(title: 'Receita 3', recipe_type: 'Sobremesa',
                            cuisine: cuisine, difficulty: 'Facil',
                            cook_time: 60,
                            ingredients: 'Farinha, fermento, ovos, leite',
                            method: 'Misture tudo e asse por 50 minutos')

    recipe4 = Recipe.create(title: 'Receita 4', recipe_type: 'Entrada',
                            cuisine: cuisine, difficulty: 'Facil',
                            cook_time: 60,
                            ingredients: 'Trigo para kibe, tomate, cebola, alface, pepino',
                            method: 'Picar os legumes, juntar e temperar a gosto')

    recipe5 = Recipe.create(title: 'Receita 5', recipe_type: 'Principal',
                            cuisine: cuisine, difficulty: 'Facil',
                            cook_time: 60,
                            ingredients: 'Pão sírio, rosbife, presunto, queijo, alface, tomate',
                            method: 'Picar os legues, juntar e temperar a gosto')

    recipe6 = Recipe.create(title: 'Receita 6', recipe_type: 'Principal',
                            cuisine: cuisine, difficulty: 'Facil',
                            cook_time: 60,
                            ingredients: 'Pão sírio, rosbife, presunto, queijo, alface, tomate',
                            method: 'Picar os legues, juntar e temperar a gosto')

    recipe7 = Recipe.create(title: 'Receita 7', recipe_type: 'Principal',
                            cuisine: cuisine, difficulty: 'Facil',
                            cook_time: 60,
                            ingredients: 'Pão sírio, rosbife, presunto, queijo, alface, tomate',
                            method: 'Picar os legues, juntar e temperar a gosto')

    recipe8 = Recipe.create(title: 'Receita 8', recipe_type: 'Principal',
                            cuisine: cuisine, difficulty: 'Facil',
                            cook_time: 60,
                            ingredients: 'Pão sírio, rosbife, presunto, queijo, alface, tomate',
                            method: 'Picar os legues, juntar e temperar a gosto')

    visit root_path
    click_on 'Ver todas'

    expect(page).to have_css('h1', text: recipe8.title)
    expect(page).to have_css('h1', text: recipe7.title)
    expect(page).to have_css('h1', text: recipe6.title)
    expect(page).to have_css('h1', text: recipe5.title)
    expect(page).to have_css('h1', text: recipe4.title)
    expect(page).to have_css('h1', text: recipe3.title)
    expect(page).to have_css('h1', text: recipe2.title)
    expect(page).to have_css('h1', text: recipe1.title)
  end
end
