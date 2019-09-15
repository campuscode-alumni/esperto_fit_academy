require 'rails_helper'

describe 'route for update plans block' do
  it 'successfully' do
    plan_basic = create(:plan, name: 'Simples', minimum_permanence: 10)
    plan = { plan: { name: 'Básico', minimum_permanence: '10'}}


    patch plan_path(plan_basic), params: {plan: plan}
    
    
    expect(response.status).to eq 302
    
    expect(response.headers['Location']).to eq(new_employee_session_url)



  end
end
