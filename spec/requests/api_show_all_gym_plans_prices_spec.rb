require 'rails_helper'

describe 'api show all gym plans prices' do
  it 'successfully' do
    # arrange all gyms
    gym = create(:gym)
    other_gym = create(:gym, name: 'Academia CampusCode')
    plan = create(:plan)
    other_plan = create(:plan, name: 'Basic')
    price = create(:price, value: 100000, gym_id: gym.id, plan_id: other_plan.id )
    other_price = create(:price, value: 500000, gym_id: gym.id, plan_id: plan.id )
    another_price = create(:price, gym_id: other_gym.id, plan_id: plan.id)

    # act
    get "/api/v1/gyms/#{gym.id}/plans"
    json_prices = JSON.parse(response.body, symbolize_names: true)
    # assert
    expect(response.status).to eq 200
    expect(json_prices[:name]).to eq gym.name
    expect(json_prices[:plans][1][:name]).to eq plan.name
    expect(json_prices[:plans][0][:name]).to eq other_plan.name
    expect(json_prices[:plans].count).to eq (2)
  end
end
