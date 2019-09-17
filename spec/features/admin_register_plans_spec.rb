require 'rails_helper'

feature 'Admin register plans' do
  scenario 'successfully' do
    # arrange
    admin = create(:employee, admin: true)

    login_as admin
    visit root_path
    click_on 'Cadastros'
    click_on 'Cadastrar Plano'
    fill_in 'Nome', with: 'Premium'
    fill_in 'Permanência mínima', with: 3
    click_on 'Cadastrar'

    # assert
    expect(page).to have_content('Premium')
    expect(page).to have_content('Permanência mínima: 3 meses')
    expect(page).to have_link('Voltar')
  end

  scenario 'and can`t be empty' do
    # arrange
    admin = create(:employee, admin: true)
    
    login_as admin
    visit root_path
    click_on 'Cadastros'
    click_on 'Cadastrar Plano'
    click_on 'Cadastrar'

    # assert
 
    expect(page).to have_content('Nome Todos os campos devem ser preenchidos')
    expect(page).to have_content('Permanência mínima Todos os campos devem ser preenchidos')
  end

  scenario 'and the name must be unique' do
    # arrange
    admin = create(:employee, admin: true)
    create(:plan)
    
    login_as admin
    visit root_path
    click_on 'Cadastros'
    click_on 'Cadastrar Plano'
    fill_in 'Nome', with: 'Premium'
    fill_in 'Permanência mínima', with: 3 
    click_on 'Cadastrar'

    # assert

    expect(page).to have_content('O nome deve ser único')
  end

  scenario 'and must be an admin to click the button' do
    # arrange
    user = create(:employee, admin: false)
    
    #act
    login_as user
    visit root_path
    click_on 'Cadastros'

    #assert
    expect(page).not_to have_content('Cadastrar planos')
  end

  scenario 'and must be unable to access the register plan route' do
    #act
    visit new_plan_path

    #assert
    expect(current_path).to eq new_employee_session_path
  end
  
  scenario 'and user must be unable to access the register plan route' do
    # arrange
    user = create(:employee, admin: false)
    
    #act
    login_as user
    visit root_path
    visit new_plan_path

    #assert
    expect(current_path).to eq root_path
  end
end