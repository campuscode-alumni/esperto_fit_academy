require 'rails_helper'

describe SimplePlanSerializer do
  subject { described_class.new(plan).as_json }
  context 'when is a used' do
    let(:plan) { create(:plan) }
    it 'correct attributes' do
      is_expected.to eq ({
        "name": plan.name,
        "minimum_permanence": plan.minimum_permanence
      })
    end
  end
end

