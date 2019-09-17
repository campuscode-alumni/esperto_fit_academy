require 'rails_helper'

feature 'API get client profile' do
  scenario 'successfully' do
    load_profile_mock 
    
    employee = create(:employee)
    client = create(:client, name: 'Customer Smith', cpf: '12345678900')

    login_as(employee)

    visit root_path
    click_on 'Listas'
    click_on 'Lista de Alunos'
    click_on 'Customer Smith'
    
    expect(page).to have_content 'Customer Street'


  end

  scenario 'and fails' do
    stub_request(:get, "http://0.0.0.0:4000/api/v1/customers/123456789").
          with(
            headers: {
            'Accept'=>'*/*',
            'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'Content-Type'=>'application/json',
            'User-Agent'=>'Faraday v0.15.4'
            }).
          to_return(status: 404, body: 'Não encontrado', headers: {})
    employee = create(:employee)
    client = create(:client, name: 'Customer Smith', cpf: '123456789')
      
    login_as(employee)

    visit root_path
    click_on 'Listas'
    click_on 'Lista de Alunos'
    click_on 'Customer Smith'
         
    expect(page).to have_content 'Perfil não encontrado'
  end
end