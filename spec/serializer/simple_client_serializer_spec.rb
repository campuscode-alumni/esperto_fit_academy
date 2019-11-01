require 'rails_helper'
describe SimpleClientSerializer do
  subject { described_class.new(client).as_json }
  context 'when is a used' do
    let (:client) { create(:client) }
    it 'returns correct attributes' do
      #=> para testar json , as_json converte direto
      expect(subject).to eq ({
        "cpf": client.cpf,
        "status": client.status
      })
    end
  end
end 