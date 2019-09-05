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

  scenario 'and only employees can see the link to the employee area' do
    # act
    visit root_path

    # asssert
    expect(page).not_to have_content('Area de Funcionarios')
  end

  scenario 'and visitors cannot enter to the employee area path' do
    # act
    visit employee_service_path

    # asssert
    expect(current_path).to eq new_employee_session_path
  end

  scenario 'and only admins can see the link to user list' do
    # arrange
    user = create(:employee, admin: false)

    # act
    login_as user
    visit root_path
    click_on 'Area de Funcionarios'

    # asssert
    expect(page).not_to have_content('Lista de Usuários')
  end

  scenario 'and users cannot enter to the users list path' do
    # arrange
    user = create(:employee, admin: false)

    # act
    login_as user
    visit employees_path

    # asssert
    expect(current_path).to eq root_path
  end

  scenario 'and users cannot enter to the users edit path' do
    # arrange
    user = create(:employee, admin: false)

    # act
    login_as user
    visit edit_employee_path(user)

    # asssert
    expect(current_path).to eq root_path
  end

  scenario 'and must fill all fields' do
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
    fill_in 'Nome', with: ''
    fill_in 'Unidade', with: ''
    fill_in 'Senha', with: 'ousada'
    click_on 'Enviar'

    expect(current_path).to eq(employee_path(user))
    expect(page).to have_content('Funcionario não alterado')
  end
end