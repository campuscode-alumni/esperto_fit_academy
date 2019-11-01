class BanWorker
  include Sidekiq::Worker

  def perform(client_id)
    ClientMailer.ban_email(client_id).deliver_now
    notify_payments_api(client_id)
  end

  private

  def notify_payments_api(client_id)
    client = Client.find(client_id)
    PaymentsApi.client.post do |req|
      req.url "payments/ban?cpf=#{client.cpf}"
    end
  end
end