module ProfileApi
  def load_profile_mock 
    stub_request(:get, "http://0.0.0.0:4000/api/v1/customers/12345678900").
          with(
            headers: {
            'Accept'=>'*/*',
            'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'Content-Type'=>'application/json',
            'User-Agent'=>'Faraday v0.15.4'
            }).
          to_return(status: 202, body: JSON.parse(
            File.read(Rails.root.join('spec', 'support', 'profile.json')),
            symbolize_names: true), headers: {})
  end
end
         