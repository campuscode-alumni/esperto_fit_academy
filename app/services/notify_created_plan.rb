class NotifyCreatedPlan < ApplicationService
  attr_accessor :price

  def initialize(price)
    @price = price
  end

  def call
    notify_payments_api(@price)
    PriceMailer.send_notification.deliver_now
  end

  def notify_payments_api(price)
    response = PaymentsApi.client.post do |req|
      req.url "plans?plan[name]=#{price.plan.name}&plan[value]=#{price.value}"
    end
  end
end