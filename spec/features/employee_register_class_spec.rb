require 'rails_helper'

feature 'Employee register class ' do 
  scenario 'sucessfully' do

    gym = create(:gym)
    trainer = create(:trainer)
    employee = create(:employee)
    login_as(employee, scope: :employee)

    visit root_path
    click_on 'Cadastrar Aula'

    fill_in 'Nome', with: 'Zumba'
    fill_in 'Preço', with: '93,90'
    fill_in 'Horário de duração', with: '45'
    fill_in 'Capacidade máxima', with: '30'
    fill_in 'Conjunto de regras', with: 'Respeitar todos os membros presentes' 
    fill_in 'Dificuldade', with: 'Médio'
    fill_in 'Equipamentos', with: 'Nenhum'
    select trainer, from: 'Professor'
    select gym, from: 'Academia'
    click_on 'Criar Aula'
    
    expect(page).to have_css('h3', text: 'Zumba')
    expect(page).to have_css('p', text: '93,90')
    expect(page).to have_css('p', text: '45')
    expect(page).to have_css('p', text: '30')
    expect(page).to have_css('p', text: 'Respeitar todos os membros presentes')
    expect(page).to have_css('p', text: 'Médio')
    expect(page).to have_css('h3', text: 'Nenhum')
    expect(page).to have_css('h3', text: trainer.name)
    expect(page).to have_css('h3', text: gym.name)
    expect(page).not_to have_link('Criar Aula')
    expect(page).to have_content('Aula cadastrada com sucesso!')

  end
end