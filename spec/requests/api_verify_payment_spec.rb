require 'rails_helper'

  describe 'API verify payment' do
    it 'get successfully' do
      stub_request(:get, "http://payment.com.br/api/v1/payments/123456").
      with(
        headers: {
       'Accept'=>'*/*',
       'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       'User-Agent'=>'Faraday v0.15.4'
        }).
      to_return(status: 200, body: File.read(Rails.root.join('spec', 'support', 'payment_unpaid.json')), headers: {'Content-Type'=>'application/json'})
        
      # arrange
      employee = create(:employee)
      client = create(:client, cpf:'123456', status: :active)

      # act
      response = Faraday.get 'http://payment.com.br/api/v1/payments/123456'

      # assert
      expect(response.status).to eq 200
      expect(response.body).to include(client.cpf)
      expect(response.body).to include('payment')
      expect(response.body).to include('pending')
    end
  end