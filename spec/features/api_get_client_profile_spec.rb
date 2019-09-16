require 'rails_helper'

feature 'API get client profile' do
  scenario 'successfully' do
    employee = create(:employee)
    client = create(:client, name: 'João Silva', cpf: '12341234')

    login_as(employee)

    visit root_path

    click_on 'Lista de alunos'

    click_on 'João Silva'

    expect(page).to have_content 'rua abacaxi'
  end
end