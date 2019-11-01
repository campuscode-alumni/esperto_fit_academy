require 'rails_helper'

describe 'only admin can delete gym' do
  it 'susscessfully' do
    gym = create(:gym)
    admin = create(:employee, admin: true, gym: nil)
    sign_in admin
    delete "/api/v1/gyms/#{gym.id}" 

    json_gym = JSON.parse(response.body, symbolize_names: true)
    
    expect(response.status).to eq 202
    expect(json_gym[:msg]).to include('Academia apagada com sucesso')
  end

  it 'and employees can not' do
    gym = create(:gym)
    employee = create(:employee, admin: false, gym: gym)
    sign_in employee

    delete "/api/v1/gyms/#{gym.id}"

    json_gym = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq 412
    expect(json_gym[:msg]).to include('Você não tem essa permissão')
  end
end
