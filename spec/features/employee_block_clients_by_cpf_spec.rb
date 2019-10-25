require 'rails_helper'

feature 'Employee block clients by CPF' do
  scenario 'successfully' do
    # arrange stubs
    load_profile_mock
    stub_request(:post, "http://esperto_fit_payments_web_run_1:3000/api/v1/payments/ban?cpf=12345678900").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Content-Length'=>'0',
          'Content-Type'=>'application/json',
          'User-Agent'=>'Faraday v0.15.4'
           }).
         to_return(status: 200, body: "", headers: {})
      
    # arrange
    employee = create(:employee)
    client = create(:client, cpf: '12345678900')

    # act
    login_as employee
    visit root_path
    click_on 'Lista de Alunos'
    click_on client.name
    # byebug
    click_on 'BANIR ALUNO'
    # expect(BanWorker).to receive(:perform_async(client.id))


    # assert
    expect(current_path).to eq client_path(client.id)
    expect(page).to have_content('CPF banido com sucesso!')
    expect(page).to have_content('Status: banished')
  end

  scenario 'and link must not show when client is alredy banished' do
    # arrange
    load_profile_mock
    client = create(:client, status: 9, cpf: '12345678900')
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
    load_profile_mock
    # arrange
    client = create(:client, status: 0, cpf: '12345678900')

    # act
    visit ban_client_path(client)

    # assert
    expect(current_path).to eq new_employee_session_path
  end

  scenario 'and client must exist' do
    # arrange
    employee = create(:employee)

    # act
    login_as employee
    visit ban_client_path(1)

    # assert
    expect(current_path).to eq clients_path
    expect(page).to have_content('Não existe esse aluno!')
  end
end
