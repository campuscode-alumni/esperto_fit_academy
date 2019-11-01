class PriceMailer < ApplicationMailer
  def send_notification
    adm_payments = 'admin@espertofit.com'
    mail(to: adm_payments, subject: 'Aviso de novo plano')
  end
end
