require 'rails_helper'
describe ClientDecorator do
  describe '.profile?' do
   
    context 'when client have a profile' do
      before do 
        load_profile_junior_mock(client.cpf) 
      end
      subject { client.decorate.has_profile }
      let (:client) { create(:client) }
      it 'returns partial html with profile' do        
       is_expected.to eq(h.render(partial: 'clients/client_have_profile',locals: { client: client }))
      end
    end
    
    context 'when client dont have a profile' do
      before do 
        null_profile_junior_mock
      end
      subject { client.decorate.has_profile }
      let(:client) { create(:client) }
      it 'returns partial message dont have profile' do
        expect(subject).to eq(h.render('clients/dont_have_profile'))
      end
    end
  end
end
