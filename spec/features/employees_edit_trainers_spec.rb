feature 'Employees edit trainers ' do
  scenario 'Successfully' do
    gym = create(:gym)
    employeer = create(:employee, email: 'email@espertofit.com.br', password: '123456', gym: gym)
    create(:trainer, name: 'Thiago', status: 0)

    login_as employeer
    visit root_path
    click_on 'Gerenciar'
    click_on 'Gerenciar Professores'
    click_on 'Thiago'
    click_on 'Editar'
    fill_in 'Nome', with: 'Karina'
    select 'Indisponível', from: 'Status'
    click_on 'Editar'

    expect(current_path).to eq(trainer_path(Trainer.last.id))
    expect(page).to have_content('Alterações realizadas com sucesso')
    expect(page).to have_content('Karina')
    expect(page).to have_content('123')
    expect(page).to have_content('Indisponível')
  end

  scenario 'all fields must fill in, in edit' do
    gym = create(:gym)
    employeer = create(:employee, email: 'email@espertofit.com.br', password: '123456', gym: gym)
    create(:trainer)

    login_as employeer
    visit root_path
    click_on 'Gerenciar'
    click_on 'Gerenciar Professores'
    click_on 'Thiago'
    click_on 'Editar'
    fill_in 'Nome', with: ''
    select 'Indisponível', from: 'Status'
    click_on 'Editar'

    # expect(current_path).to eq(new_trainer_path)
    expect(page).to have_content 'Nome não pode ficar em branco'
  end

  scenario 'field cpf must be unique , in edit' do
    gym = create(:gym)
    employeer = create(:employee, email: 'email@espertofit.com.br', password: '123456', gym: gym)
    create(:trainer, cpf: '123', email: 'trainer@espertofit.com.br')
    create(:trainer, name: 'Kah', cpf: '1234', email: 'ka@espertofit.com.br')

    login_as employeer
    visit root_path
    click_on 'Gerenciar'
    click_on 'Gerenciar Professores'
    click_on 'Thiago'
    click_on 'Editar'
    fill_in 'CPF', with: '1234'
    click_on 'Editar'

    # expect(current_path).to eq(new_trainer_path)
    expect(page).to have_content 'CPF já está em uso'
  end

  scenario 'employee must be autenticated to edit trainers' do
    trainer = create(:trainer, cpf: '123')
    visit edit_trainer_path(trainer)

    expect(current_path).to eq(new_employee_session_path)
  end
end
