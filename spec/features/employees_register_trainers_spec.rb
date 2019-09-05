require 'rails_helper'

feature "employees register trainers" do
  scenario "successfully" do
    
    employeer = create(:employee, email: "email@espertofit.com.br", password: "123456")

    visit root_path
    
    click_on "Entrar"

    fill_in "Email", with: "email@espertofit.com.br"
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
    expect(page).to have_content("Disponível")

    
  end
  scenario 'all fields must fill in' do
    employeer = create(:employee, email: "email@espertofit.com.br", password: "123456")

    visit root_path
    
    click_on "Entrar"

    fill_in "Email", with: "email@espertofit.com.br"
    fill_in "Senha", with: "123456"
    click_on "Entrar"

    click_on "Cadastrar professor"

    fill_in "Nome", with: ""
    fill_in "CPF", with: "123"
    click_on "Cadastrar"

    #expect(current_path).to eq(new_trainer_path)
    expect(page).to have_content 'Nome não pode ficar em branco'

  end
  scenario 'field cpf must be unique' do
    employeer = create(:employee, email: "email@espertofit.com.br", password: "123456")
    trainer = create(:trainer)
    visit root_path
    
    click_on "Entrar"

    fill_in "Email", with: "email@espertofit.com.br"
    fill_in "Senha", with: "123456"
    click_on "Entrar"

    click_on "Cadastrar professor"

    fill_in "Nome", with: "Thiago"
    fill_in "CPF", with: "123"
    click_on "Cadastrar"

    #expect(current_path).to eq(new_trainer_path)
    expect(page).to have_content 'CPF já está em uso'

  end

  



end