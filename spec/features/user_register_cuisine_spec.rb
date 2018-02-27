require 'rails_helper'

feature 'User register cuisine' do
  scenario 'successfully' do

    visit new_cuisine_path
    fill_in 'Nome', with: 'Brasileira'
    click_on 'Enviar'

    expect(page).to have_css('h1', text: 'Brasileira')
    expect(page).to have_content('Nenhuma receita encontrada para este tipo de cozinha')
  end

  scenario 'and must fill in name' do
    visit new_cuisine_path
    fill_in 'Nome', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Name não pode ficar em branco')
  end

  scenario 'and must be unique' do
    visit new_cuisine_path
    fill_in 'Nome', with: 'Japonesa'
    click_on 'Enviar'

    visit new_cuisine_path
    fill_in 'Nome', with: 'Japonesa'
    click_on 'Enviar'

    expect(page).to have_content('Name já está em uso')
  end


end
