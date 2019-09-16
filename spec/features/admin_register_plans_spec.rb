require 'rails_helper'

feature 'Admin register plans' do
  scenario 'successfully' do
    # arrange
    admin = create(:employee, admin: true)
    
    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: admin.email
    fill_in 'Senha', with: admin.password 
    click_on 'Entrar'
    click_on 'Cadastrar Planos'
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
    
    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: admin.email
    fill_in 'Senha', with: admin.password 
    click_on 'Entrar'
    click_on 'Cadastrar Planos'
    click_on 'Cadastrar'

    # assert
 
    expect(page).to have_content('Nome Todos os campos devem ser preenchidos')
    expect(page).to have_content('Permanência mínima Todos os campos devem ser preenchidos')
  end

  scenario 'and the name must be unique' do
    # arrange
    admin = create(:employee, admin: true)
    create(:plan)
    
    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: admin.email
    fill_in 'Senha', with: admin.password 
    click_on 'Entrar'
    click_on 'Cadastrar Planos'
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
    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password 
    click_on 'Entrar'

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
    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password 
    click_on 'Entrar'
    visit new_plan_path

    #assert
    expect(current_path).to eq root_path
  end
end