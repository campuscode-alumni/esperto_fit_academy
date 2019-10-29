class ClientMailer < ApplicationMailer
  def ban_email(client_id)
    @client = Client.find(client_id)
    mail(to: @client.email, subject: 'Sua conta foi banida!')
  end
end
