class ClientDecorator < SimpleDelegator
  def profile?(client)
    return 'clients/partial2' if client.nil? || client.profile.nil?

    'clients/partial1'
  end
end