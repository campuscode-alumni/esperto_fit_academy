require 'rails_helper'

describe 'show gym details ' do
  it 'sucessfully' do
    admin = create(:employee, admin: true)
    gym = create(:gym)

    sign_in admin
    get "/api/v1/gyms/#{gym.id}"

    expect(response.status).to eq 200
    expect(response.body).to include gym.open_hour
    expect(response.body).to include gym.close_hour
    expect(response.body).to include gym.working_days
    expect(response.body).to include gym.address
    expect(response.body).to include '/academia_01.jpeg'
  end

  it 'returns an error if the gym is not found' do
    admin = create(:employee, admin: true)

    sign_in admin
    get '/api/v1/gyms/1111'

    json_gym = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq 404
    expect(json_gym[:message]).to eq 'Academia não encontrada'
  end
end
