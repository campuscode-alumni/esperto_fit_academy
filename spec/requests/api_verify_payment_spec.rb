require 'rails_helper'

  describe 'API verify payment' do
    it 'get successfully' do
      # arrange
      employee = create(:employee)
      client = create(:client, cpf:'123456', status: :active)

      # act
      response = Faraday.get 'http://localhost:4000/api/v1/payments/123456'

      # assert
      expect(response.status).to eq 200
      expect(response.body).to include(client.cpf)
      expect(response.body).to include('payment')
      expect(response.body).to include('pending')
    end
  end