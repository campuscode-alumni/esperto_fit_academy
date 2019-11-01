require 'rails_helper'

feature 'Employee verify payment status' do 
  scenario 'successfully' do 
    load_profile_mock
    load_unpaid_mock

    # arrange
    employee = create(:employee)
    client = create(:client, cpf: '12345678900', status: :active)

    # act
    login_as employee
    visit root_path
    click_on 'Lista de Alunos'
    click_on client.name
    click_on 'Atualizar status de pagamentos'

    # assert
    expect(current_path).to eq client_path(client)
    expect(page).to have_content('Status: indebted')
  end

  scenario 'and must turn active if payment is ok' do
    load_profile_mock
    load_paid_mock

    # arrange
    employee = create(:employee)
    client = create(:client, name: 'Ciro', cpf: '12345678900', status: :indebted)
    # Status do ultimo pagamento é paid

    # act
    login_as employee
    visit root_path
    click_on 'Lista de Alunos'
    click_on client.name
    click_on 'Atualizar status de pagamentos'

    # assert
    expect(current_path).to eq client_path(client)
    expect(page).to have_content('Status: active')
  end

  scenario 'and client must not be banished' do
    load_profile_mock
    load_paid_mock
    
    # arrange
    employee = create(:employee)
    client = create(:client, name: 'Ciro', cpf: '12345678900', status: :banished)
    # Status do ultimo pagamento é paid

    # act
    login_as employee
    visit root_path
    click_on 'Lista de Alunos'
    click_on client.name
    click_on 'Atualizar status de pagamentos'

    # assert
    expect(current_path).to eq client_path(client)
    expect(page).to have_content('Status: banished')
  end
end
