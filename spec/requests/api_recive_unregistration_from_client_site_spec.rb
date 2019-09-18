require 'rails_helper'

describe 'API recive unregistration from client site' do 
  it 'successfully' do 
    # arrange
    client = create(:client, cpf: '12312312300')

    # act
    post "/api/v1/inactivate_client/#{client.cpf}"
    json_client = JSON.parse(response.body, symbolize_names: true)

    #assert
    expect(response.status).to eq 202
    expect(json_client[:status]).to eq 'inactive'
  end 

  it 'and CPF must exit' do
    # act
    post "/api/v1/inactivate_client/000"

    # assert
    expect(response.status).to eq 404
    expect(response.body).to include('CPF não encontrado')
  end

  it 'and client must not been banished' do 
    # arrange
    client = create(:client, cpf: '12312312300', status: :banished)

    # act
    post "/api/v1/inactivate_client/#{client.cpf}"
    json_client = JSON.parse(response.body, symbolize_names: true)

    #assert
    expect(response.status).to eq 202
    expect(json_client[:status]).to eq 'banished'
  end 

  it 'and client must not been inacitve' do 
    # arrange
    client = create(:client, cpf: '12312312300', status: :inactive)

    # act
    post "/api/v1/inactivate_client/#{client.cpf}"
    json_client = JSON.parse(response.body, symbolize_names: true)

    #assert
    expect(response.status).to eq 202
    expect(json_client[:status]).to eq 'inactive'
  end 

end