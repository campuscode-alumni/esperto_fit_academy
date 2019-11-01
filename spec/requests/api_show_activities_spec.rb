require 'rails_helper'

describe 'api show all gyms' do
  it 'successfully' do
    gym = create(:gym, name: 'Academia Paulista')
    another_gym = create(:gym, name: 'Academia Madalena')
    trainer = create(:trainer)
    activity = create(:activity, gym_id: gym.id, trainer_id: trainer.id)
    another_activity = create(:activity, name: 'Yoga', gym_id: gym.id, trainer_id: trainer.id)
    spare_activity = create(:activity, name: 'Boxe', gym_id: another_gym.id, trainer_id: trainer.id)
    admin = create(:employee, admin: true)    

    sign_in admin
    get "/api/v1/gyms/#{gym.id}/activities"

    json_activities = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq 200
    expect(json_activities[:data][0][:attributes][:name]).to include activity.name
    expect(json_activities[:data][1][:attributes][:name]).to include another_activity.name
    expect(response.body).not_to include spare_activity.name
  end

  it 'fails' do
    admin = create(:employee, admin: true)

    sign_in admin
    get '/api/v1/gyms/7858/activities'

    json_gyms = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq 404
    expect(json_gyms[:messages]).to eq 'Nenhuma classe cadastrada'
  end
end
