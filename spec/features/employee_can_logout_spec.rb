require 'rails_helper'

feature 'Employee can logout' do
  scenario 'successfully' do
    gym = create(:gym)
    employeer = create(:employee, email: 'email@espertofit.com.br', password: '123456', gym: gym)

    login_as employeer
    visit root_path
    click_on 'Sair'

    expect(current_path).to eq root_path
    expect(page).to have_link 'Entrar'
  end
end