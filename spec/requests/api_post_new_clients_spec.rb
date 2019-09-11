require 'rails_helper'

describe 'api post new clients' do
  it 'successfully' do
    gym = create(:gym)
    plan = create(:plan)

    post api_v1_clients_path, params: {client: {name: 'Mario', cpf: '123', email: 'teste@espertofit.com.br', gym_id: gym.id, plan_id: plan.id}}
    
    json_client = JSON.parse(response.body, symbolizes_names: true)

    expect(response.status).to eq 201
    expect(json_client['name']).to include 'Mario'
    expect(json_client['gym_id']).to eq gym.id
    expect(json_client['plan_id']).to eq plan.id
  end
  it 'and all fields must be fill' do
    gym = create(:gym)

    post api_v1_clients_path, params: {client: {name: 'Mario', cpf: , email: 'teste@espertofit.com.br', gym_id: gym.id, plan_id: }}
    
    json_client = JSON.parse(response.body, symbolizes_names: true)

    expect(response.status).to eq 406
    expect(json_client[message])

  end
end