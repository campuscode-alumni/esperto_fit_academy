require 'rails_helper'

feature 'Employee unactivate client' do
  scenario 'successfully' do
    # arrange
    employee = create(:employee)
    client = create(:client)

    # act
    login_as employee
    visit root_path
    click_on 'Lista de alunos'
    click_on client.name 
    click_on 'SUSPENDER ALUNO'

    # assert
    expect(current_path).to eq client_path(client.id) 
    expect(page).to have_content('CPF suspenso com sucesso!')
    expect(page).to have_content('Status: suspended')
  end

  scenario 'and link must not show when client is alredy suspended' do
    # arrange
    client = create(:client, status: 2)
    employee = create(:employee)

    # act
    login_as employee
    visit root_path
    click_on 'Lista de alunos'
    click_on client.name

    # assert 
    expect(current_path).to eq client_path(client.id) 
    expect(page).to have_content('Status: suspended')
    expect(page).not_to have_content('SUSPENDER ALUNO') 
  end

  
end