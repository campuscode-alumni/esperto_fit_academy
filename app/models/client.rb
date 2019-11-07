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
    logger.debug("#{self} baned ")
    banished!
    notify_payments_api
  end

  private

  def notify_payments_api
    logger.debug("notification realized with success")

    Faraday.post('http://espertofitpayments_web_1:80/api/v1/payments/ban?cpf=222222222')
  end
end


