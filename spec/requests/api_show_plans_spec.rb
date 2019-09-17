require 'rails_helper'

describe 'api shoe plans' do
  it 'successfully show all' do
      plan_basic = create(:plan, name: "Básico", minimum_permanence: 12)
      plan_plus = create(:plan, name: "Plus", minimum_permanence: 3)

      get api_v1_plans_path

      json_plan = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq 200
      expect(response.body).to include(plan_basic.name)
      expect(response.body).to include('12')
      expect(response.body).to include(plan_plus.name)
      expect(response.body).to include('3')
  end

  it 'fails to find plans' do

    get api_v1_plans_path

    json_plan = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq 404
    expect(response.body).to include('Nenhum plano encontrado')

  end

  it 'successfully find one plan' do
    plan_basic = create(:plan, name: "Básico", minimum_permanence: 12)
    plan_plus = create(:plan, name: "Plus", minimum_permanence: 3)

    get api_v1_plan_path(plan_basic.id)

    json_plan = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq 200
    expect(response.body).to include(plan_basic.name)
    expect(response.body).to include('12')
    expect(response.body).not_to include(plan_plus.name)
  end

  it 'fails to find one plan' do

    get api_v1_plan_path(00)
    
    json_plan = JSON.parse(response.body, symbolize_names: true)
    
    
    expect(response.status).to eq 404
    expect(response.body).to include('Nenhum plano encontrado')

  end

end
