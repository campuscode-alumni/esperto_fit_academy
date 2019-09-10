require 'rails_helper'

describe 'api show all gyms' do
  it 'successfully' do
    # arrange all gyms
    gym = create(:gym)
    another_gym = create(:gym)

    # act

    get api_v1_gyms_path

    json_gyms = JSON.parse(response.body, symbolizes_names: true)

    expect(response.status).to eq 200
    expect(json_gyms[0][:name]).to eq gym.name
    expect(json_gyms[1][:name]).to eq another_gym.name
  end
end