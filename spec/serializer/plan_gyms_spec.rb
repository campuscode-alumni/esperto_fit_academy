require 'rails_helper'
describe PlanGymSerializer do
  subject { described_class.new(gym).as_json }
  context 'when search for prices ' do
    let (:gym) { create(:gym) }
    it 'return correct attributes' do
      plan = create(:plan)
      other_plan = create(:plan, name: 'Basic')
      create(:price, value: 100_000, gym_id: gym.id, plan_id: plan.id)
      create(:price, value: 500_000, gym_id: gym.id, plan_id: other_plan.id)
      expect(subject).to eq ({
        "plans": [
          {
            "name": 'Premium',
            "minimum_permanence": 3,
            "price": 100_000
          },
          {
            "name": 'Basic',
            "minimum_permanence": 3,
            "price": 500_000
          }
        ]
      })
    end
  end
end