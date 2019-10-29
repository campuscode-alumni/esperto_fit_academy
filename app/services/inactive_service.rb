class InactiveService < ApplicationService
  attr_reader :client

  def initialize(client)
    @client = client
  end

  def call
    client.inactive! if client.active?
  end
end