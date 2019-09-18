class Client < ApplicationRecord
  belongs_to :gym
  belongs_to :plan

  validates :name, :cpf, :email, :gym_id, :plan_id, presence: true
  validates :cpf, uniqueness: true

  enum status: {active: 0, inactive: 1, suspended: 2, indebted: 6, banished: 9}

  def last_payment_status
    Payment.find(cpf).first.status
  end
  
  def profile  
    @profile ||= Profile.find(cpf)
  end

  def ban
    self.banished!
    notify_payments_api
  end

  private

  def notify_payments_api
    Faraday.post("http://payment.com.br/api/v1/payments/ban?cpf=#{self.cpf}")
  end
end
