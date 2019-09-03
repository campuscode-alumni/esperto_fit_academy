require 'rails_helper'

feature "employees register trainers" do
  scenario "successfully" do
    
    employeer = create(:employee, email: "email@email.com", password: "123456")

    visit root_path
    
    click_on "Entrar"

    fill_in "Email", with: "email@email.com"
    fill_in "Senha", with: "123456"
    click_on "Entrar"

    click_on "Cadastrar professor"

    fill_in "Nome", with: "Karina"
    fill_in "CPF", with: "123"
    click_on "Cadastrar"

    expect(current_path).to eq(trainer_path(Trainer.last.id))
    expect(page).to have_content("Professor cadastrado com sucesso")
    expect(page).to have_content("Karina")
    expect(page).to have_content("123")
    
  end
  scenario 'all fields must fill in' do
    employeer = create(:employee, email: "email@email.com", password: "123456")

    visit root_path
    
    click_on "Entrar"

    fill_in "Email", with: "email@email.com"
    fill_in "Senha", with: "123456"
    click_on "Entrar"

    click_on "Cadastrar professor"

    fill_in "Nome", with: ""
    fill_in "CPF", with: "123"
    click_on "Cadastrar"

    #expect(current_path).to eq(new_trainer_path)
    expect(page).to have_content 'Todos os campos devem ser preenchidos'

  end




end