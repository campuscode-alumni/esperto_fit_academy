require 'rails_helper'

describe 'API recive unregistration from client site' do 
  it 'successfully' do 
    # arrange
    client = create(:client, cpf: '12312312300')

    # act
    post "/api/v1/inactivate_client/#{client.cpf}"

    #assert
    expect(response.status).to eq 202
    expect(response.body).to eq 'Cliente desmatriculado com sucesso'
  end 

  it 'and CPF must exit' do
    # act
    get "/api/v1/clients/consult_cpf/000"

    # assert
    expect(response.status).to eq 404
    expect(response.body).to include('CPF não encontrado')
  end
end