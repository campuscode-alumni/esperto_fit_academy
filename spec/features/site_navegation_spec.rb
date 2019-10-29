require 'rails_helper'

feature 'only employee can create gyms' do
  scenario 'and unauthourizaded user cant see button' do
    trainer = create(:trainer)
    login_as(trainer, scope: :trainer)

    visit root_path

    expect(page).not_to have_link 'Cadastrar Academia'
  end

  scenario 'and not logged user cant see button' do
    visit root_path

    expect(page).not_to have_link 'Cadastrar Academia'
  end

  scenario 'and visitor cant acess by route' do
    visit new_gym_path

    expect(current_path).to eq new_employee_session_path
  end
end