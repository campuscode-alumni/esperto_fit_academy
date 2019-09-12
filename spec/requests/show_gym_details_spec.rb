require 'rails_helper'

describe 'show gym details ' do
  it 'sucessfully' do
    gym = create(:gym)

    get "/api/v1/gyms/#{gym.id}"
    json_gym = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq 200
    expect(json_gym[:gym][:cod]).to eq gym.cod
    expect(json_gym[:gym][:open_hour]).to eq gym.open_hour
    expect(json_gym[:gym][:close_hour]).to eq gym.close_hour
    expect(json_gym[:gym][:working_days]).to eq gym.working_days
    expect(json_gym[:gym][:address]).to eq gym.address
    expect(json_gym[:gym][:images].first).to eq "http://www.example.com/rails/active_storage/blobs/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBCZz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--f38dc1ef0ace3dbcd4f962ceffdf6ffa578a23f1/academia_01.jpeg"
  end
  
  it 'returns an error if the gym is not found' do
    get "/api/v1/gyms/1111"
    json_gym = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq 404
    expect(json_gym[:message]).to eq 'Academia não encontrada'
  end
end
