require 'rails_helper'

feature 'Employee verify payment status' do 
  scenario 'successfully' do 
    # arrange
    employee = create(:employee)
    client = create(:client, cpf: '123456', status: :active)

    # act
    login_as employee
    visit root_path
    click_on 'Lista de alunos'
    click_on client.name
    click_on 'Atualizar status de pagamentos'


    # assert
    expect(current_path).to eq client_path(client)
    # Falta criar uma payment com status indebted!
    expect(page).to have_content('Status: indebted')
  end
end