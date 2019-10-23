require 'rails_helper'

describe 'api send registration data' do
	it 'successfully' do
		# arrange
		admin = create(:employee, admin: true, gym: nil)
		client = create(:client, cpf: '12312312300')

		# act
		sign_in admin
		post "/api/v1/clients/#{client.cpf}"
		json_client = JSON.parse(response.body, symbolize_names: true)

		# assert
		expect(response.status).to eq 302
		expect(response.body).to include client.name
		expect(response.body).to include client.email
		expect(response.body).to include client.status
		expect(response.body).to include client.cpf
	end
	
	it 'and return message if client not found' do
		# arrange
		admin = create(:employee, admin: true, gym: nil)
		client = create(:client)

		# act
		sign_in admin
		post "/api/v1/clients/00000000"

		# assert
		expect(response.status).to eq 404
		expect(response.body).to include('Cliente não encontrado')
	end
end