require 'rails_helper'

feature 'Admin edit plans' do
  scenario 'successffuly' do
    # arrange
    admin = create(:employee, admin: true)
    plan_basic = create(:plan, name: 'Simples', minimum_permanence: 10)
    create(:plan, name: 'Premium', minimum_permanence: 10)
  
    # act
    login_as admin

    visit root_path
    click_on 'Gerenciar'
    click_on 'Gerenciar Planos'
    click_on 'Simples'
    click_on 'Editar'

    fill_in 'Nome', with: 'Básico'
    fill_in 'Permanência mínima', with: '5'
    click_on 'Salvar'

    # asssert
    expect(current_path).to eq plan_path(plan_basic)
    expect(page).to have_content('Básico')
    expect(page).to have_content('Permanência mínima: 5 meses')
    expect(page).not_to have_content('Simples')
    expect(page).not_to have_content('Permanência mínima: 10')    
  end

  scenario 'and filds cannot be empty' do
    # arrange
    admin = create(:employee, admin: true)
    create(:plan, name: 'Simples', minimum_permanence: 10)

    # act
    login_as admin

    visit root_path
    click_on 'Gerenciar Planos'
    click_on 'Simples'
    click_on 'Editar'

    fill_in 'Nome', with: ''
    click_on 'Salvar'

    # asssert
    expect(page).to have_content('Nome Todos os campos devem ser preenchidos')
    expect(page).not_to have_content('Alterações realizadas com sucesso')    
  end

  scenario 'and just a admin visit the edit plan page with a direct route' do
    # arrange
    employee = create(:employee, admin: false)
    plan_basic = create(:plan, name: 'Simples', minimum_permanence: 10)

    # act
    login_as employee

    visit edit_plan_path(plan_basic)

    # asssert
    expect(current_path).to eq(root_path)   
  end

  scenario 'and only admin see manegement plans button' do
    # arrange
    employee = create(:employee, admin: false)

    # act
    login_as employee

    visit root_path

    # asssert
    expect(page).not_to have_content('Gerenciar Planos')
  end
end