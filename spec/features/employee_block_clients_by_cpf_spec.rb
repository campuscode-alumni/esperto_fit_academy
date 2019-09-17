require 'rails_helper'

feature 'Employee block clients by CPF' do
  scenario 'successfully' do
    # arrange
    employee = create(:employee)
    client = create(:client)

    # act
    login_as employee
    visit root_path
    click_on 'Lista de Alunos'
    click_on client.name
    click_on 'BANIR ALUNO'

    # assert 
    expect(current_path).to eq client_path(client.id) 
    expect(page).to have_content('CPF banido com sucesso!')
    expect(page).to have_content('Status: banished')
  end

  scenario 'and link must not show when client is alredy banished' do
    # arrange
    client = create(:client, status: 9)
    employee = create(:employee)

    # act
    login_as employee
    visit root_path
    click_on 'Lista de Alunos'
    click_on client.name

    # assert 
    expect(current_path).to eq client_path(client.id) 
    expect(page).to have_content('Status: banished')
    expect(page).not_to have_content('BANIR ALUNO') 
  end
  scenario 'and link must be protected to visitors' do
    # arrange
    client = create(:client, status: 0)

    # act
    visit ban_client_path(client)

    #assert 
    expect(current_path).to eq new_employee_session_path
  end

  scenario 'and client must exist' do
    #arrange
    employee = create(:employee)

    #act
    login_as employee
    visit ban_client_path(1)

    #assert
    expect(current_path).to eq clients_path
    expect(page).to have_content('Não existe esse aluno!')
  end
end