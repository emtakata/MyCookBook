require 'rails_helper'

feature 'User edit cuisine' do
  scenario 'successfully' do
    cuisine = Cuisine.create(name: 'Brasileira')

    visit cuisine_path(cuisine)
    click_on "Editar"

    fill_in "Nome", with: 'Japonesa'
    click_on "Enviar"

    expect(current_path).to eq(cuisine_path(cuisine))
    expect(page).to have_css('h1', text: 'Japonesa')
  end

  scenario 'without name' do
    cuisine = Cuisine.create(name: 'Brasileira')

    visit cuisine_path(cuisine)
    click_on 'Editar'

    fill_in 'Nome', with: ''
    click_on 'Enviar'

    expect(page).to have_css('p', text: 'Name não pode ficar em branco')
  end
end
