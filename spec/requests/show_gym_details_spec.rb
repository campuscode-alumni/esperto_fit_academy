require 'rails_helper'

describe 'show gym details ' do
  it 'sucessfully' do
    gym = create(:gym)

    get "/api/v1/gyms/#{gym.id}"
    json_gym = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq 200
    expect(json_gym[:cod]).to eq gym.cod
    expect(json_gym[:open_hour]).to eq gym.open_hour
    expect(json_gym[:close_hour]).to eq gym.close_hour
    expect(json_gym[:working_days]).to eq gym.working_days
    expect(json_gym[:address]).to eq gym.address
  end
end
