class ClientDecorator < ApplicationDecorator

  delegate_all

  def has_profile
    return h.render('clients/dont_have_profile') if object.nil? || object.profile.nil?
    
    h.render(partial: 'clients/client_have_profile', locals: { client: client } ) 
  end
end