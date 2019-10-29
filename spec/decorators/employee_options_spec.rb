require 'rails_helper'
#classe
describe EmployeeDecorator do

  #metodo
  describe '.admin_option' do
    subject { described_class.new(employee).admin_option }
    #comportamentos do metodo
    context 'when user is admin' do
      let (:employee) { create(:employee, :admin) }

      it 'returns sim' do
        is_expected.to eq("Admin: Sim")
      end
    end
    #comportamentos do metodo
    context 'when user is not admin' do
      let(:employee) { create(:employee, :trainer) }

      it 'returns nao' do
        expect(subject).to eq("Admin: Nao")
      end
    end

  end
end