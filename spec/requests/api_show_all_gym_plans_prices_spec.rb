require 'rails_helper'

describe 'api show all gym plans prices' do
  it 'successfully' do
    # arrange all gyms
    admin = create(:employee, admin: true)
    gym = create(:gym)
    other_gym = create(:gym, name: 'Academia CampusCode')
    plan = create(:plan)
    other_plan = create(:plan, name: 'Basic')
    price = create(:price, value: 100_000, gym_id: gym.id, plan_id: plan.id)
    other_price = create(:price, value: 500_000, gym_id: gym.id, plan_id: other_plan.id)
    create(:price, gym_id: other_gym.id, plan_id: plan.id)

    # act
    sign_in admin
    get "/api/v1/gyms/#{gym.id}/plans"
    json_response = JSON.parse(response.body, symbolize_names:true)
    # assert
    expect(response.status).to eq 200
    expect(response.body).to include plan.name
    expect(response.body).to include price.value.to_s
    expect(response.body).to include other_plan.name
    expect(response.body).to include other_price.value.to_s
    # expect(response.body).to include 2
  end
  it 'fails' do
    admin = create(:employee, admin: true)

    sign_in admin
    get '/api/v1/gyms/100/plans'

    json_prices = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq 404
    expect(json_prices[:messages]).to eq 'Nenhum plano cadastrado'
  end
end
