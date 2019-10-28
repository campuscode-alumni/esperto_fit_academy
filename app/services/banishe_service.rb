class BanisheService < ApplicationService
  attr_reader :client

  def initialize(client)
    @client = client
  end
  def call
    client.banished!
    BanWorker.perform_async(client)
  end
end