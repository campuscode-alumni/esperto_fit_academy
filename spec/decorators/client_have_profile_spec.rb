require 'rails_helper'
describe ClientDecorator do

  describe '.have_profile' do
    before{ load_profile_junior_mock }
    context 'when client have a profile' do
      subject { described_class.new(client).have_profile(client) }
      let (:client) { create(:client) }

      it 'returns string partial with profile' do
        is_expected.to eq("clients/partial1")
      end
    end
    
    context 'when client dont have a profile' do
      subject { described_class.new(client).have_profile(nil) }
      let(:client) { create(:client) }
      it 'returns partial message dont have profile' do
        expect(subject).to eq("clients/partial2")
      end
    end
  end
end
