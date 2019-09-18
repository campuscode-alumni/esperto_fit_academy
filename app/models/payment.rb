class Payment

  attr_reader :value, :dt_venc, :status
   
  def initialize(value:, dt_venc:, status:)
    @value = value
    @dt_venc = dt_venc
    @status = status
  end

  def self.find(cpf)
    response = PaymentsApi.client.get do |req|
      req.url "payments/#{cpf}"
    end
    response.body[:payments].map do |payment|
      new(payment)
    end
  end

end