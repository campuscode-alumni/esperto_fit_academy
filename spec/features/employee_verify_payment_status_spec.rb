require 'rails_helper'

feature 'Employee verify payment status' do 
  scenario 'successfully' do 
    load_profile_mock
    stub_request(:get, 'http://esperto_fit_payments_web_run_1:3000/api/v1/payments/12345678900')
      .with(
        headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Content-Type' => 'application/json',
          'User-Agent' => 'Faraday v0.15.4'
        }
      )
      .to_return(status: 200, body: File.read(
        Rails.root.join('spec', 'support', 'payment_unpaid.json')
      ), headers: { 'Content-Type': 'application/json' })

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
    stub_request(:get, 'http://esperto_fit_payments_web_run_1:3000/api/v1/payments/12345678900')
      .with(
        headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Content-Type' => 'application/json',
          'User-Agent' => 'Faraday v0.15.4'
        }
      )
      .to_return(status: 200, body: File.read(Rails.root.join('spec', 'support', 'payment_paid.json')), headers: { 'Content-Type' => 'application/json' })

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
    stub_request(:get, 'http://esperto_fit_payments_web_run_1:3000/api/v1/payments/12345678900')
      .with(
        headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Content-Type' => 'application/json',
          'User-Agent' => 'Faraday v0.15.4'
        }
      )
      .to_return(status: 200, body: File.read(Rails.root.join('spec', 'support', 'payment_paid.json')), headers: { 'Content-Type' => 'application/json' })
    
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
