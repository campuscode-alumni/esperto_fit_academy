module ProfileApi
  def load_profile_mock 
    stub_request(:get, "http://0.0.0.0:4000/api/v1/search/customer?document=12345678900").
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

  def load_profile_junior_mock(cpf)
    stub_request(:get, "http://0.0.0.0:4000/api/v1/search/customer?document=#{cpf}").
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

  def null_profile_junior_mock
    stub_request(:get, "http://0.0.0.0:4000/api/v1/search/customer?document=385.093.321-01").
    with(
      headers: {
     'Accept'=>'*/*',
     'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
     'Content-Type'=>'application/json',
     'User-Agent'=>'Faraday v0.15.4'
      }).
    to_return(status: 200, body: "", headers: {})      
  end
end
         