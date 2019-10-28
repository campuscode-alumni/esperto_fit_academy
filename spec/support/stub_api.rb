module ProfileApi
  def load_profile_mock 
    stub_request(:get, "http://0.0.0.0:5000/api/v1/search/customer?document=12345678900").
          with(
            headers: {
            'Accept'=>'*/*',
            'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'Content-Type'=>'application/json',
            'User-Agent'=>'Faraday v0.15.4'
            }).
          to_return(status: 202, body: File.read(Rails.root.join('spec', 'support', 'profile.json')),
                     headers: { 'Content-Type' => 'aplication/json' })
  end

  def load_ban_mock
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
  end

  def load_plan_mock
    stub_request(:post, "http://esperto_fit_payments_web_run_1:3000/api/v1/plans?plan%5Bname%5D=Premium&plan%5Bvalue%5D=9999").
            with(
              headers: {
              'Accept'=>'*/*',
              'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
              'Content-Length'=>'0',
              'Content-Type'=>'application/json',
              'User-Agent'=>'Faraday v0.15.4'
              }).
            to_return(status: 200, body: "", headers: {})
  end

  def load_unpaid_mock
    stub_request(:get, 'http://esperto_fit_payments_web_run_1:3000/api/v1/payments/12345678900')
      .with(
        headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Content-Type' => 'application/json',
          'User-Agent' => 'Faraday v0.15.4'
        }
      )
      .to_return(status: 200, body: File.read(
        Rails.root.join('spec', 'support', 'payment_unpaid.json')
      ), headers: { 'Content-Type': 'application/json' })
  end

  def load_paid_mock 
    stub_request(:get, 'http://esperto_fit_payments_web_run_1:3000/api/v1/payments/12345678900')
      .with(
        headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Content-Type' => 'application/json',
          'User-Agent' => 'Faraday v0.15.4'
        }
      )
      .to_return(status: 200, body: File.read(
        Rails.root.join('spec', 'support', 'payment_paid.json')),
        headers: { 'Content-Type' => 'application/json' })
  end
end
         