require 'rails_helper'

feature 'Admin register another employee' do
  scenario 'successfully' do
    # arrange
    gym = create(:gym)
    employee = create(:employee, admin: true, gym: gym)

    # act
    login_as employee
    visit root_path
    click_on 'Cadastros'
    click_on 'Cadastrar Funcionário'
    fill_in 'Nome', with: 'Alan'
    select gym.name, from: 'Unidade'
    fill_in 'Email específico', with: 'alan.h@espertofit.com.br'
    fill_in 'Senha', with: '123456'
    click_on 'Enviar'

    # assert
    expect(page).to have_content('Nome: Alan')
    expect(page).to have_content(gym.name)
    expect(page).to have_content('Status: Ativo')
    expect(page).to have_content('Email específico: alan.h@espertofit.com.br')
    expect(page).to have_css('p', text: 'Admin: Nao')
    expect(page).to have_content('Funcionario cadastrado com sucesso!')
    expect(page).to have_link('Voltar')
  end

  scenario 'and must fill in all the fields' do
    # arrange
    gym = create(:gym)
    employee = create(:employee, admin: true, gym: gym)

    # act
    login_as employee
    visit root_path
    click_on 'Cadastros'
    click_on 'Cadastrar Funcionário'
    click_on 'Enviar'

    # assert
    expect(page).to have_content('Nome deve ser preenchido!')
    expect(page).to have_content('Cadastro de Funcionário')
  end

  scenario 'and email must be unique' do
    # arrange
    gym = create(:gym)
    employee = create(:employee, admin: true, gym: gym)

    # act
    login_as employee
    visit root_path
    click_on 'Cadastros'
    click_on 'Cadastrar Funcionário'
    fill_in 'Nome', with: 'Alan'
    select gym.name, from: 'Unidade'
    fill_in 'Email específico', with: 'batata@espertofit.com.br'
    click_on 'Enviar'

    # assert
    expect(page).to have_content('Email deve ser unico!')
    expect(page).to have_content('Cadastro de Funcionário')
  end

  scenario 'and employee must be logged on' do
    visit root_path

    # assert
    expect(page).not_to have_content('Cadastrar novo funcionário')
  end

  scenario 'and the employee must be an admin to register another employee' do
    # arrange
    gym = create(:gym)
    employee = create(:employee, admin: false, gym: gym)

    # act
    login_as employee
    visit root_path
    click_on 'Cadastros'

    # assert
    expect(page).not_to have_content('Cadastrar novo funcionário')
  end

  scenario 'and visitor can access nothing of employees by route' do
    visit new_employee_path

    expect(current_path).to eq new_employee_session_path
  end

  scenario 'and the email must be from the EspertoFit domain' do
    # arrange
    gym = create(:gym)
    employee = create(:employee, admin: true, gym: gym)

    # act
    login_as employee
    visit root_path
    click_on 'Cadastros'
    click_on 'Cadastrar Funcionário'
    fill_in 'Nome', with: 'Alan'
    select gym.name, from: 'Unidade'
    fill_in 'Email específico', with: 'ciro@gmail.com'
    fill_in 'Senha', with: '123456'
    click_on 'Enviar'

    # assert
    expect(page).to have_content('Cadastro de Funcionário')
    expect(page).to have_content('Email específico deve ser corporativo!')
  end

  scenario 'and status must be active' do
    # arrange
    gym = create(:gym)
    employee = create(:employee, admin: true, status: :unactive, gym: gym)

    # act
    login_as employee
    visit root_path

    # assert
    expect(current_path).to eq new_employee_session_path
    expect(page).to have_content('Você esta INATIVO')
  end
end
