require 'rails_helper'

feature 'Admin set prices' do
  scenario 'successfully' do
    # arrange
    admin = create(:employee, admin: true)
    plan = create(:plan)
    gym = create(:gym)

    # act
    login_as admin
    visit root_path
    click_on 'Cadastrar Preços'
    select 'Academia 1', from: 'Unidades'
    select 'Premium', from: 'Planos'
    fill_in 'Valor', with: '9999'
    click_on 'Cadastrar'

    # assert
    expect(page).to have_content("O plano #{plan.name} na unidade #{gym.name} foi dado o valor de R$99.99 com sucesso!")
    expect(current_path).to eq new_price_path
  end

  scenario 'and must fill the value' do
    # arrange
    admin = create(:employee, admin: true)
    plan = create(:plan)
    gym = create(:gym)

    # act
    login_as admin
    visit root_path
    click_on 'Cadastrar Preços'
    select gym.name, from: 'Unidades'
    select 'Premium', from: 'Planos'
    fill_in 'Valor', with: ''
    click_on 'Cadastrar'

    # assert
    expect(page).to have_content('Você deve preencher todos os campos')
    expect(current_path).to eq new_price_path
  end

  scenario 'and must not be a visitor' do
    # arrange 

    # act
    visit new_price_path

    # assert
    expect(current_path).to eq new_employee_session_path
  end

  scenario 'and must be an admin' do
    # arrange 
    user = create(:employee)
    # act
    login_as user
    visit new_price_path

    # assert
    expect(current_path).to eq root_path
  end
end