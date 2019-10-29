require 'rails_helper'

feature 'employee manages gym' do
  # before do 
  #   DatabaseCleaner.clean 
  # end
  scenario 'successfully' do
    create(:gym, name: 'Academia Paulista')
    create(:gym, name: 'Academia Madalena')
    create(:gym, name: 'Academia Consolação')
    gym = create(:gym, name: 'Academia Oscar Freire')
    employee = create(:employee, gym: gym)
    login_as(employee)

    visit root_path
    click_on 'Listas'
    click_on 'Lista de Academias'
    click_on 'Academia Oscar Freire'
    click_on 'Editar'
    fill_in 'Endereço', with: 'Rua Oscar Freire, 1439'
    click_on 'Atualizar Academia'

    expect(page).to have_content('Alterações realizadas com sucesso!')
    expect(page).to have_css('h3', text: 'Academia Oscar Freire')
    expect(page).to have_css('p', text: 'Rua Oscar Freire, 1439')
  end

  scenario 'and only employee can see the edit option' do
    paulista = create(:gym, name: 'Academia Paulista')

    visit "/gyms/#{paulista.id}"

    expect(current_path).to eq new_employee_session_path
  end

  scenario 'only employee of the gym can edit' do
    create(:gym, name: 'Academia Paulista')
    create(:gym, name: 'Academia Madalena')
    create(:gym, name: 'Academia Consolação')
    gym = create(:gym, name: 'Academia Oscar Freire')
    employee = create(:employee, gym: gym)
    login_as(employee)

    visit root_path
    click_on 'Lista de Academias'
    click_on 'Academia Madalena'

    expect(page).not_to have_link('Editar')
  end

  scenario 'and all fields must be filled' do
    create(:gym, name: 'Academia Paulista')
    create(:gym, name: 'Academia Madalena')
    create(:gym, name: 'Academia Consolação')
    gym = create(:gym, name: 'Academia Oscar Freire')
    employee = create(:employee, gym: gym)
    login_as(employee)

    visit root_path
    click_on 'Lista de Academias'
    click_on 'Academia Oscar Freire'
    click_on 'Editar'
    fill_in 'Endereço', with: ''
    click_on 'Atualizar Academia'

    expect(page).not_to have_content('Alterações realizadas com sucesso!')
    expect(page).to have_content('Endereço não pode ficar em branco')
  end

  scenario 'and gym name must be unique' do
    create(:gym, name: 'Academia Paulista')
    create(:gym, name: 'Academia Madalena')
    create(:gym, name: 'Academia Consolação')
    gym = create(:gym, name: 'Academia Oscar Freire')
    employee = create(:employee, gym: gym)
    login_as(employee)

    visit root_path
    click_on 'Lista de Academias'
    click_on 'Academia Oscar Freire'
    click_on 'Editar'
    fill_in 'Nome', with: 'Academia Paulista'
    click_on 'Atualizar Academia'

    expect(page).not_to have_content('Alterações realizadas com sucesso!')
    expect(page).to have_content('Nome já está em uso')
  end

  scenario 'and admin also can edit' do
    create(:gym, name: 'Academia Paulista')
    create(:gym, name: 'Academia Madalena')
    create(:gym, name: 'Academia Consolação')
    create(:gym, name: 'Academia Oscar Freire')
    employee = create(:employee, admin: true)
    login_as(employee)

    visit root_path

    click_on 'Lista de Academias'
    click_on 'Academia Oscar Freire'
    click_on 'Editar'
    fill_in 'Endereço', with: 'Rua Oscar Freire, 1439'
    click_on 'Atualizar Academia'

    expect(page).to have_content('Alterações realizadas com sucesso!')
    expect(page).to have_css('h3', text: 'Academia Oscar Freire')
    expect(page).to have_css('p', text: 'Rua Oscar Freire, 1439')
  end
end
