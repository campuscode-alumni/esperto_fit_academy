require 'rails_helper'

feature 'Employee access his profile page' do
  scenario 'successfully' do
    # arrange
    user = create(:employee, name: 'Usuario Teste')

    # act
    login_as user 
    visit root_path
    click_on 'Meu Perfil'

    # assert
    expect(current_path).to eq employee_path(user)
    expect(page).to have_content('Usuario Teste')
  end

  scenario 'and cannot access others profile' do
    # arrange
    user = create(:employee, name: 'Usuario Teste')
    other_user = create(:employee, email: 'email_teste@espertofit.com.br', name: 'Outro Usuario')

    # act
    login_as user 
    visit employee_path(other_user)

    # assert
    expect(current_path).to eq root_path 

  end
  
end
