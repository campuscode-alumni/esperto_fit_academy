class BanisheService < ApplicationService
  attr_reader :client

  def initialize(client)
    @client = client
  end
  
  def call
    if client.active?
      client.inactive!
      flash[:notice] = t(:client_inactive, 
      scope: [:notice])
    else 
      flash[:alert] = t(:fail_inactive, 
      scope: [:alert, :client])
  end
end