require 'rails_helper'

describe 'api show all gym plans prices' do
  it 'successfully' do
    # arrange all gyms
    gym = create(:gym)
    other_gym = create(:gym, name: 'Academia CampusCode')
    plan = create(:plan)
    other_plan = create(:plan, name: 'Basic')
    price = create(:price, value: 100000, gym_id: gym.id, plan_id: plan.id )
    other_price = create(:price, value: 500000, gym_id: gym.id, plan_id: other_plan.id )
    another_price = create(:price, gym_id: other_gym.id, plan_id: plan.id)

    # act
    get "/api/v1/gyms/#{gym.id}/plans"
    json_prices = JSON.parse(response.body, symbolize_names: true)

    # assert
    expect(response.status).to eq 200
    expect(json_prices[:plans][0][:name]).to eq plan.name
    expect(json_prices[:plans][0][:price]).to eq price.value
    expect(json_prices[:plans][1][:name]).to eq other_plan.name
    expect(json_prices[:plans][1][:price]).to eq other_price.value
    expect(json_prices[:plans].count).to eq (2)
  end

  it 'fails' do
    
    get "/api/v1/gyms/100/plans"

    json_prices = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq 404
    expect(json_prices[:messages]).to eq 'Nenhum plano cadastrado'
  end
end
