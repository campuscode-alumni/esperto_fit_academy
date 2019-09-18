require 'rails_helper'

feature 'admin can remove gym' do
  scenario 'successfully' do
    paulista = create(:gym, name: 'Academia Paulista')
    madalena = create(:gym, name: 'Academia Madalena')
    consolacao  = create(:gym, name: 'Academia Consolação')
    oscar_freire = create(:gym, name: 'Academia Oscar Freire')
    employee = create(:employee, admin: true)
    login_as (employee)

    visit root_path
    click_on 'Listas'
    click_on 'Lista de Academias'
    click_on 'Academia Oscar Freire'
    click_on 'Remover'
    
    expect(page).to have_content('Academia removida com sucesso!')
  end
end