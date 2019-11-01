require 'rails_helper'

describe SimpleGymSerializer do
  subject { described_class.new(gym).as_json }
  context 'when is a used' do
    let (:gym) { create(:gym) }
    it 'returns correct attributes' do
      expect(subject).to include(
        "cod": gym.cod,
        "name": gym.name,
        "open_hour": gym.open_hour,
        "close_hour": gym.close_hour,
        "working_days": gym.working_days,
        "address": gym.address
      )
    end
  end
end 