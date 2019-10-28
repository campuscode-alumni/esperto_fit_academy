require 'rails_helper'

feature 'Employee unregister clients' do
  scenario 'successfully' do
    load_profile_mock
    # arrange
    employee = create(:employee, admin: true)
    client = create(:client, cpf: '12345678900')

    # act
    login_as employee
    visit root_path
    click_on 'Listas'
    click_on 'Lista de Alunos'
    click_on client.name
    click_on 'DESVINCULAR ALUNO'

    # assert
    expect(current_path).to eq client_path(client.id) 
    expect(page).to have_content('Cliente desvinculado com sucesso!')
    expect(page).to have_content('Status: inactive')
  end
  scenario 'and link must not show when client is alredy inactive' do
    load_profile_mock
    # arrange
    client = create(:client, status: 1, cpf: '12345678900')
    employee = create(:employee)

    # act
    login_as employee
    visit root_path
    click_on 'Lista de Alunos'
    click_on client.name

    # assert 
    expect(current_path).to eq client_path(client.id) 
    expect(page).to have_content('Status: inactive')
    expect(page).not_to have_content('DESVINCULAR ALUNO') 
  end
  scenario 'and link must be protected to visitors' do
    load_profile_mock
    # arrange
    client = create(:client, status: 0, cpf: '12345678900')

    # act
    visit inactive_client_path(client)

    #assert 
    expect(current_path).to eq new_employee_session_path
  end
  scenario 'and client must exist' do
    # arrange
    employee = create(:employee)

    # act
    login_as employee
    visit inactive_client_path(1)

    # assert
    expect(current_path).to eq clients_path
    expect(page).to have_content('Não existe esse aluno!')
  end
  scenario 'and status must be active to unregister' do
    load_profile_mock
    # arrange
    client = create(:client, status: 6, cpf: '12345678900')
    employee = create(:employee)

    # act
    login_as employee
    visit root_path
    click_on 'Lista de Alunos'
    click_on client.name

    # assert 
    expect(current_path).to eq client_path(client.id)
    expect(page).to have_content('Status: indebted')
    expect(page).not_to have_content('DESVINCULAR ALUNO')
  end
  scenario 'and must be active even from route' do
    load_profile_mock
    # arrange
    client = create(:client, status: 6, cpf: '12345678900')
    employee = create(:employee)

    # act
    login_as employee
    visit inactive_client_path(client)

    # assert
    expect(current_path).to eq client_path(client.id) 
    expect(page).to have_content('Cliente deve estar com status ativo para desvincular.')
  end
end
