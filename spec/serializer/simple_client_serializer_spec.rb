require 'rails_helper'
describe SimpleClientSerializer do
    subject { described_class.new(client).attributes }
    context 'when is a used' do
      let (:client) { create(:client) }
      it 'returns correct attributes' do
        expect(subject.keys).to eq [:cpf,:status]
      end
    end
end 