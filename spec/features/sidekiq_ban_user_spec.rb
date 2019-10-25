require 'rails_helper'
require 'sidekiq/testing'
Sidekiq::Testing.inline! 

feature 'test sidekiq'do 
  scenario 'successfully' do
    client = create(:client, cpf: '12345678900')
    stub_request(:post, "http://esperto_fit_payments_web_run_1:3000/api/v1/payments/ban?cpf=12345678900").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Content-Length'=>'0',
          'Content-Type'=>'application/json',
          'User-Agent'=>'Faraday v0.15.4'
           }).
           to_return(status: 200, body: "", headers: {})

    BanWorker.perform_async(client.id)
    # assert_worked_
  end
end

