require 'rails_helper'

describe 'api show all gyms' do
  it 'successfully' do
    # arrange all gyms
    admin = create(:employee, admin: true, gym: nil)
    gym = create(:gym)
    another_gym = create(:gym)

    # act
    sign_in admin
    get api_v1_gyms_path

    #json_gyms = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq 200
    expect(response.body).to include gym.name
    expect(response.body).to include another_gym.name
  end

  it 'fails' do
    admin = build(:employee, admin: true, gym: nil) 
    sign_in admin
    get api_v1_gyms_path

    json_gyms = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq 404
    expect(json_gyms[:messages]).to eq 'Nenhuma unidade cadastrada'
  end
end
