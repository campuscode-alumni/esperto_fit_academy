require 'rails_helper'

feature 'Employee register another employee' do
  scenario 'successfully' do
    # arrange
    employee = create(:employee)

    # act
    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: 'batata@espertofit.com.br'
    fill_in 'Senha', with: '123456'
    click_on 'Entrar'
    click_on ('Cadastrar novo funcionário')
    fill_in 'Nome', with: 'Alan'
    fill_in 'Status', with: 'active'
    fill_in 'Unidade', with: '01'
    fill_in 'Email específico', with: 'alan.h@espertofit.com.br'
    click_on 'Cadastrar'

    # assert
    expect(page).to have_content('Nome: Alan')
    expect(page).to have_content('Unidade: 1')
    expect(page).to have_content('Status: active')
    expect(page).to have_content('Email específico: alan.h@espertofit.com.br')
    expect(page).to have_content('Admin: false')
    expect(page).to have_content('Funcionario cadastrado com sucesso!')
    expect(page).to have_link('Voltar')
  end

  scenario 'and must fill in all the fields' do
    # arrange
    employee = create(:employee)

    # act
    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: 'batata@espertofit.com.br'
    fill_in 'Senha', with: '123456'
    click_on 'Entrar'
    click_on ('Cadastrar novo funcionário')
    click_on 'Cadastrar'

    # assert
    expect(page).to have_content('Name deve ser preenchido!')
    
    expect(page).to have_content('Preencha para cadastrar um usuário')
  end

  scenario 'and email must be unique' do
    # arrange
    employee = create(:employee)

    # act
    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: 'batata@espertofit.com.br'
    fill_in 'Senha', with: '123456'
    click_on 'Entrar'
    click_on ('Cadastrar novo funcionário')
    fill_in 'Nome', with: 'Alan'
    fill_in 'Status', with: 'active'
    fill_in 'Unidade', with: '01'
    fill_in 'Email específico', with: 'batata@espertofit.com.br'
    click_on 'Cadastrar'

    # assert
    expect(page).to have_content('Email deve ser unico!')
    expect(page).to have_content('Preencha para cadastrar um usuário')
  end

  scenario 'and employee must be logged on' do
    visit root_path

    # assert
    expect(page).not_to have_content('Cadastrar novo funcionário')
  end
end
