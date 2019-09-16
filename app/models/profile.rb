class Profile

  attr_reader :id, :first_name, :last_name, :document, :account_id, :address, :date_of_birth, :gender, :nickname, :contact, :payment_method, :work_document

  def initialize(**args)
    args.each do |key, value|
      instance_variable_set("@#{key.to_s}", value)
    end
  end

  def self.find(id)
    response = EspertoFitPersonal.client.get do |req|
      req.url "customers/#{id}"
    end
    return new(response.body[:profile]) if response.status == 202
  end
end