require 'rails_helper'

feature 'Employees edit trainers ' do
  scenario 'Successfully' do
    gym = create(:gym)
    employeer = create(:employee, email: "email@espertofit.com.br", password: "123456", gym:gym)
    trainer = create(:trainer, name: "Thiago", status: 0)

    visit root_path
    
    click_on "Entrar"

    fill_in "Email", with: "email@espertofit.com.br"
    fill_in "Senha", with: "123456"
    click_on "Entrar"

    click_on "Gerenciar Professores"
  
    click_on "Thiago"
    click_on "Editar"
    
    fill_in "Nome", with: "Karina"
    select "Indisponível", from: 'Status'
    click_on "Editar"

    expect(current_path).to eq(trainer_path(Trainer.last.id))
    expect(page).to have_content("Alterações realizadas com sucesso")
    expect(page).to have_content("Karina")
    expect(page).to have_content("123")
    expect(page).to have_content("Indisponível")
  end

  scenario 'all fields must fill in, in edit' do
    gym = create(:gym)
    employeer = create(:employee, email: "email@espertofit.com.br", password: "123456", gym:gym)
    trainer = create(:trainer)
    visit root_path
    
    click_on "Entrar"

    fill_in "Email", with: "email@espertofit.com.br"
    fill_in "Senha", with: "123456"
    click_on "Entrar"

    click_on "Gerenciar Professores"
  
    click_on "Thiago"
    click_on "Editar"
    
    fill_in "Nome", with: ""
    select "Indisponível", from: 'Status'
    click_on "Editar"

    #expect(current_path).to eq(new_trainer_path)
    expect(page).to have_content 'Nome não pode ficar em branco'

  end
  scenario 'field cpf must be unique , in edit' do
    gym = create(:gym)
    employeer = create(:employee, email: "email@espertofit.com.br", password: "123456", gym:gym)
    trainer = create(:trainer, cpf: "123")
    other_trainer = create(:trainer, name: "Kah", cpf: "1234")
    visit root_path
    
    click_on "Entrar"

    fill_in "Email", with: "email@espertofit.com.br"
    fill_in "Senha", with: "123456"
    click_on "Entrar"

    click_on "Gerenciar Professores"
  
    click_on "Thiago"
    click_on "Editar"
    
    fill_in "CPF", with: "1234"
    click_on "Editar"

    #expect(current_path).to eq(new_trainer_path)
    expect(page).to have_content 'CPF já está em uso'

  end

  scenario 'employee must be autenticated to edit trainers' do
    trainer = create(:trainer, cpf: "123")
    visit edit_trainer_path(trainer)

    expect(current_path).to eq(new_employee_session_path)
  end
end