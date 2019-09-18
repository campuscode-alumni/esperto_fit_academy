require 'rails_helper'

feature 'trainers linked to gym ' do
  scenario 'successfully' do
    gym = create(:gym)
    employeer = create(:employee, email: 'email@espertofit.com.br', password: '123456', gym_id: gym.id)

    login_as employeer
    visit root_path

    click_on 'Cadastros'
    click_on 'Cadastrar Professor'

    fill_in 'Nome', with: 'Thiago'
    fill_in 'CPF', with: '23'
    click_on 'Cadastrar'

    expect(page).to have_content 'Academias'
    expect(page).to have_content gym.name.to_s
  end

  scenario 'employee add more units ' do
    gym1 = create(:gym, name: 'Paulista')
    gym2 = create(:gym, name: 'Lapa')
    gym3 = create(:gym, name: 'Jaguare')
    employeer = create(:employee, email: 'email@espertofit.com.br', password: '123456', gym_id: gym1.id, admin: true)
    trainer = create(:trainer, name: 'Thi')
    GymTrainer.create(trainer: trainer, gym: gym1)

    login_as employeer
    visit root_path
    click_on 'Gerenciar'
    click_on 'Gerenciar Professores'
    click_on 'Thi'
    click_on 'Adicionar mais unidades'
    within("##{gym2.id}") do
      click_on 'Vincular'
    end

    click_on 'Voltar'

    expect(page).to have_content gym1.name.to_s
    expect(page).to have_content gym2.name.to_s
    expect(page).not_to have_content gym3.name.to_s
  end

  scenario 'employee add more units ' do
    gym1 = create(:gym, name: 'Paulista')
    gym2 = create(:gym, name: 'Lapa')

    employeer = create(:employee, email: 'email@espertofit.com.br', password: '123456', gym_id: gym1.id, admin: true)
    trainer = create(:trainer, name: 'Thi')
    GymTrainer.create(trainer: trainer, gym: gym1)

    login_as employeer
    visit root_path
    click_on 'Gerenciar'
    click_on 'Gerenciar Professores'
    click_on 'Thi'
    click_on 'Adicionar mais unidades'
    within("##{gym1.id}") do
      click_on 'Desvincular'
    end
    within("##{gym2.id}") do
      click_on 'Vincular'
    end
    click_on 'Voltar'

    expect(page).not_to have_content gym1.name.to_s
    expect(page).to have_content gym2.name.to_s
  end

  scenario 'only admin can add trainer to more academys' do
    gym = create(:gym)
    employeer = create(:employee, email: 'email@espertofit.com.br', password: '123456', gym: gym)
    create(:trainer, name: 'Thi')

    login_as(employeer)
    visit root_path
    click_on 'Gerenciar'
    click_on 'Gerenciar Professores'
    click_on 'Thi'

    expect(page).not_to have_link 'Adicionar mais unidades'
  end

  scenario 'only admin can add trainer to more academys' do
    gym = create(:gym)
    employeer = create(:employee, email: 'email@espertofit.com.br', password: '123456', gym: gym)
    trainer = create(:trainer, name: 'Thi')
    login_as(employeer)

    visit add_units_trainer_path(trainer)

    expect(current_path).to eq root_path
  end
end
