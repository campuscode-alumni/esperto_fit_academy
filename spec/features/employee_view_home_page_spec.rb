require 'rails_helper'

feature 'employee view home page' do
  scenario 'sucessfully' do
    employee = create(:employee)
    login_as(employee, scope: :employee)

    visit root_path

    expect(page).to have_css('h1', text: 'Esperto Fit')
  end

  scenario 'and register a new gym' do
    employee = create(:employee)
    login_as(employee, scope: :employee)

    visit root_path

    click_on 'Cadastrar Academia'
    save_page

    fill_in 'Nome', with: 'Academia Paulista'
    fill_in 'Código', with: '001'
    fill_in 'Endereço', with: 'Av Paulista, 123'
    fill_in 'Horário de abertura', with: '09:00'
    fill_in 'Horário de fechamento', with: '23:00'
    fill_in 'Dias de funcionamento', with: 'Segunda à Sexta'
    attach_file 'Galeria', [Rails.root.join('spec', 'support', 'academia_01.jpeg'), Rails.root.join('spec', 'support', 'academia_02.jpg')]
   
    click_on 'Criar Academia'

    expect(page).to have_content('Academia cadastrada')
    expect(page).to have_css('h3', text: 'Academia Paulista')
    expect(page).to have_css('p', text: 'Av Paulista, 123')
    expect(page).to have_css('img[src*="academia_01.jpeg"]')
    expect(page).to have_css('img[src*="academia_02.jpg"]')
    expect(page).not_to have_link('Criar Academia')
  end

  scenario 'and fields must be unique' do
    employee = create(:employee)
    gym = create(:gym, name: "Academia Paulista", cod: "001")
    login_as(employee, scope: :employee) 

    visit root_path
    
    click_on 'Cadastrar Academia'

    fill_in 'Nome', with: 'Academia Paulista'
    fill_in 'Código', with: '001'
    fill_in 'Endereço', with: 'Av Paulista, 123'
    fill_in 'Horário de abertura', with: '09:00'
    fill_in 'Horário de fechamento', with: '23:00'
    fill_in 'Dias de funcionamento', with: 'Segunda à Sexta'
    #attach_file 'Galeria', Rails.root.join('spec', 'support', 'unidade.jpg')
    click_on 'Criar Academia'

    expect(page).to have_content('Nome já está em uso')
    expect(page).not_to have_css('h3', text: 'Academia Paulista')
  end

  scenario 'and fields must be fill' do
    employee = create(:employee)  
    gym = build(:gym, name: "", cod: "")
    login_as(employee, scope: :employee)

    visit root_path
    
    click_on 'Cadastrar Academia'
    click_on 'Criar Academia'

    expect(page).to have_content('Nome não pode ficar em branco')
  end
  
end