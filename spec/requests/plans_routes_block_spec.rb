require 'rails_helper'

describe 'block direct routes for plans if are not a admin' do
  it 'successfully block update' do
    plan_basic = create(:plan, name: 'Simples', minimum_permanence: 10)
    plan = { plan: { name: 'Básico', minimum_permanence: '10'}}


    patch plan_path(plan_basic), params: {plan: plan}
    
    
    expect(response.status).to eq 302 
    expect(response.headers['Location']).to eq(new_employee_session_url)
  end

  it 'successfully block create' do
    plan = { plan: { name: 'Básico', minimum_permanence: '10'}}
    patch new_plan_path, params: {plan: plan}
    
    
    expect(response.status).to eq 302
    expect(response.headers['Location']).to eq(new_employee_session_url)
  end

  it 'successfully block delete' do
    plan_basic = create(:plan, name: 'Simples', minimum_permanence: 10)
    plan = { plan: { name: 'Básico', minimum_permanence: '10'}}

    delete plan_path(plan_basic)
        
    expect(response.status).to eq 302
    expect(response.headers['Location']).to eq(new_employee_session_url)
  end
end
