require 'rails_helper'
require 'sidekiq/testing'
Sidekiq::Testing.inline! 

feature 'test sidekiq'do 
  scenario 'successfully' do
    client = create(:client, cpf: '12345678900')
    load_ban_mock

    BanWorker.perform_async(client.id)
    # assert_worked_
  end
end

