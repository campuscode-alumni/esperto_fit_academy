require 'rails_helper'

feature 'employee view home page' do
  scenario 'sucessfully' do
    visit root_path

    expect(page).to have_css('h1', text: 'Esperto Fit')
  end

  scenario 'and register a new gym' do
    visit root_path

    click_on 'Cadastrar Academia'

    fill_in 'Nome', with: 'Academia Paulista'
    fill_in 'Código', with: '001'
    fill_in 'Endereço', with: 'Av Paulista, 123'
    fill_in 'Horário de abertura', with: '09:00'
    fill_in 'Horário de fechamento', with: '23:00'
    fill_in 'Dias de funcionamento', with: 'Segunda à Sexta'
    click_on 'Enviar'

    expect(page).to have_content('Academia cadastrada')
    expect(page).to have_css('h3', text: 'Academia Paulista')
    expect(page).to have_css('p', text: 'Av Paulista, 123')
    expect(page).not_to have_link('Enviar')
  end
end