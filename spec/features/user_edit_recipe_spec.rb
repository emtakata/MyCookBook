require 'rails_helper'

feature 'User edit recipe' do
  scenario 'successfully' do
    cuisine = Cuisine.create(name: 'Capixaba')
    Cuisine.create(name: 'Brasileira')
    recipe = Recipe.create(
      title: 'Muqueca', recipe_type: 'Tipo tipo', difficulty: 'Fácil',
      cook_time: 30, ingredients: 'Leite de coco, Cebola, tomate, salsinha, tainha',
      method: 'Junte tudo em fogo brando e espere', cuisine: cuisine
    )

    visit root_path
    click_on recipe.title
    click_on 'Editar'

    fill_in 'Título', with: 'Brigadeiro'
    fill_in 'Tipo Receita', with: 'Sobremesa'
    fill_in 'Dificuldade', with: 'Médio'
    fill_in 'Tempo de preparo', with: 45
    fill_in 'Ingredientes', with: 'Leite condensado, chocolate em pó, manteiga'
    fill_in 'Como Preparar', with: 'Em uma panela, junte tudo em fogo baixo mexa até soltar do fundo'
    select 'Brasileira', from: 'Cozinha'
    click_on 'Atualizar'

    expect(current_path).to eq(recipe_path(recipe.id))
    expect(page).to have_css('h1', text: 'Brigadeiro')
    expect(page).to have_css('p', text: 'Médio')
    expect(page).to have_css('p', text: 'Sobremesa')
    expect(page).to have_css('p', text: '45 minutos')
    expect(page).to have_css('p', text: 'Leite condensado, chocolate em pó, manteiga')
    expect(page).to have_css('p', text: 'Em uma panela, junte tudo em fogo baixo mexa até soltar do fundo')
    expect(page).to have_css('p', text: 'Brasileira')
  end

  scenario 'empty fields' do
    cuisine = Cuisine.create(name: 'Capixaba')
    Cuisine.create(name: 'Brasileira')
    recipe = Recipe.create(
      title: 'Muqueca', recipe_type: 'Tipo tipo', difficulty: 'Fácil',
      cook_time: 30, ingredients: 'Leite de coco, Cebola, tomate, salsinha, tainha',
      method: 'Junte tudo em fogo brando e espere', cuisine: cuisine
    )

    visit root_path
    click_on recipe.title
    click_on 'Editar'

    fill_in 'Título', with: ''
    fill_in 'Tipo Receita', with: ''
    fill_in 'Dificuldade', with: ''
    fill_in 'Tempo de preparo', with: ''
    fill_in 'Ingredientes', with: ''
    fill_in 'Como Preparar', with: ''
    select 'Brasileira', from: ''
    click_on 'Atualizar'

    expect(page).to have_css('p', text: 'Todos os campos são obrigatórios!')
  end
end
