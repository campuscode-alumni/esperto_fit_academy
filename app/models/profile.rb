class Profile

  attr_reader :id, :first_name, :last_name, :document, :account_id, :address, :date_of_birth, :gender, :nickname, :contact, :payment_method, :work_document

  def initialize(**args)
    args.each do |key, value|
      instance_variable_set("@#{key.to_s}", value)
    end
  end

  def self.find(cpf)
    response = EspertoFitPersonal.client.get do |req|
      req.url "customers/#{cpf}"
    end
    
    return new(response.body[0][:profile]) if response.status == 202

  end
end