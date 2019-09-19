class Profile

  attr_reader :id, :first_name, :last_name, :document, :address, :date_of_birth, :gender, :nickname, :contact, :payment_method

  def initialize(**args)
    args.each do |key, value|
      instance_variable_set("@#{key.to_s}", value)
    end
  end

  def self.find(cpf)
    response = EspertoFitPersonal.client.get do |req|
      req.url "search/customer?document=#{cpf}"
    end
    
    return new(response.body) if response.status == 202
  end
end