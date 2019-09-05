require 'rails_helper'

feature 'trainers linked to gym 'do
  scenario 'successfully' do
    gym = create(:gym)
    employeer = create(:employee, email: "email@espertofit.com.br", password: "123456",gym_id: gym.id )

    visit root_path

    click_on 'Entrar'

    fill_in "Email", with: "email@espertofit.com.br"
    fill_in "Senha", with: "123456"
    click_on "Entrar"

    click_on "Cadastrar professor"

    fill_in "Nome", with: "Thiago"
    fill_in "CPF", with: "23"
    click_on "Cadastrar"

    expect(page).to have_content "Academias"
    expect(page).to have_content "#{gym.id}"
  end
end