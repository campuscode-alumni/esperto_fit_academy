require 'rails_helper'

describe 'api post new clients' do
  it 'successfully' do
    gym = create(:gym)
    plan = create(:plan)
    admin = create(:employee, admin: true)    

    sign_in admin
    post api_v1_clients_path, params: { client: { name: 'Mario', cpf: '123', email: 'teste@espertofit.com.br', gym_id: gym.id, plan_id: plan.id } }
    json_client = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq 201
    expect(json_client[:data][:attributes][:name]).to include 'Mario'
    expect(json_client[:data][:attributes][:gym_id]).to eq gym.id
    expect(json_client[:data][:attributes][:plan_id]).to eq plan.id
  end

  it 'and all fields must be fill' do
    gym = create(:gym)
    admin = create(:employee, admin:true)
    sign_in admin
    post api_v1_clients_path, params: { client: { name: 'Mario', cpf: '', email: 'teste@espertofit.com.br', gym_id: gym.id, plan_id: '' } }

    json_client = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq 412
    expect(json_client[:message]).to include 'Não foi possivel cadastrar esse aluno'
    expect(json_client[:errors]).to include 'CPF não pode ficar em branco'
    expect(json_client[:errors]).to include 'Plano não pode ficar em branco'
  end
end
