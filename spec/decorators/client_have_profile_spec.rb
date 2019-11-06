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
       
       expect(subject).not_to have_content('Perfil não encontrado')
       expect(subject).to have_content(client.profile.address)

      end
    end
    
    context 'when client dont have a profile' do
      before do 
        null_profile_junior_mock(client.cpf)
      end
      subject { client.decorate.has_profile }
      let(:client) { create(:client) }
      it 'returns partial message dont have profile' do
        expect(subject).to have_css('p', text:   'Perfil não encontrado')
        expect(subject).not_to have_css('p', text: 'Endereço')
      end
    end
  end
end
