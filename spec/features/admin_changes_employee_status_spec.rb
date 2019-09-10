require 'rails_helper'

feature 'Admin change employee status' do
  scenario 'successfully deactivate him' do
    # arrange
    admin = create(:employee, admin: true)
    user = create(:employee, name: 'Roberto da Silva', email: 'cenoura@espertofit.com.br', status: 'active')

    # act
    login_as admin 
    visit root_path
    click_on 'Lista de Funcionários'
    click_on 'Roberto da Silva'
    click_on 'Editar'
    click_on 'Alterar status'
   

    expect(current_path).to eq(employee_path(user))
    expect(page).to have_css('h1', text: 'Roberto da Silva')  
    expect(page).to have_css('p', text: 'unactive')
  end

  scenario 'successfully activate him' do
    # arrange
    admin = create(:employee, admin: true)
    user = create(:employee, name: 'Roberto da Silva', email: 'cenoura@espertofit.com.br', status: 'unactive')

    # act
    login_as admin 
    visit root_path
    click_on 'Lista de Funcionários Inativos'
    click_on 'Roberto da Silva'
    click_on 'Editar'
    click_on 'Alterar status'
   

    expect(current_path).to eq(employee_path(user))
    expect(page).to have_css('h1', text: 'Roberto da Silva')  
    expect(page).to have_css('p', text: 'active')
  end

  scenario 'and only admin can access the routes' do
    #arrange
    user = create(:employee, name: 'Roberto da Silva', email: 'cenoura@espertofit.com.br', status: 'active')

    # act
    visit change_status_employee_path(user)

    # assert
    expect(current_path).to eq new_employee_session_path
  end

  scenario 'and can list all the unactivate employees' do
    # arrange
    admin = create(:employee, admin: true)
    user = create(:employee, name: 'Roberto da Silva', email: 'cenoura@espertofit.com.br', status: 'unactive')
    create(:employee, name: 'Pedro da Silva', email: 'inativo@espertofit.com.br', status: 'unactive')
    create(:employee, name: 'John da Silva', email: 'john_silva@espertofit.com.br', status: 'active')

    # act
    login_as admin 
    visit root_path
    click_on 'Lista de Funcionários Inativos'

    expect(page).to have_css('li', text: 'Roberto da Silva')
    expect(page).to have_css('li', text: 'Pedro da Silva')
    expect(page).not_to have_css('li', text: 'John da Silva')
  end

  scenario 'and can list all the activate employees' do
    # arrange
    admin = create(:employee, admin: true)
    user = create(:employee, name: 'Roberto da Silva', email: 'cenoura@espertofit.com.br', status: 'active')
    create(:employee, name: 'Pedro da Silva', email: 'inativo@espertofit.com.br', status: 'unactive')
    create(:employee, name: 'John da Silva', email: 'john_silva@espertofit.com.br', status: 'active')

    # act
    login_as admin 
    visit root_path
    click_on 'Lista de Funcionários'

    expect(page).to have_css('li', text: 'Roberto da Silva')
    expect(page).not_to have_css('li', text: 'Pedro da Silva')
    expect(page).to have_css('li', text: 'John da Silva')
  end

  scenario 'and only admins can access the unactive employees list' do
    # arrange 
    user = create(:employee, name: 'Roberto da Silva', email: 'cenoura@espertofit.com.br', status: 'active' , admin: false)

    # act
    login_as user
    visit employees_unactives_path

    # assert
    expect(current_path).to eq root_path
  end
end