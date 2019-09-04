require 'rails_helper'

feature 'Admin edit employee' do
  scenario 'successfully' do
    # arrange
    employee = create(:employee, admin: true)
    user = create(:employee, name: 'Roberto da Silva', email: 'cenoura@espertofit.com.br')

    # act
    login_as employee 
    visit root_path
    click_on 'Area de Funcionarios'
    click_on 'Lista de Usuários'
    click_on 'Roberto da Silva'
    click_on 'Editar'
    fill_in 'Nome', with: 'Roperto'
    fill_in 'Unidade', with: '99'
    fill_in 'Senha', with: 'ousada'
    click_on 'Enviar'

    expect(current_path).to eq(employee_path(user))
    expect(page).to have_css('h1', text: 'Roperto')
    expect(page).to have_css('p', text: '99')
    expect(page).to have_css('p', text: 'active')
  end
end