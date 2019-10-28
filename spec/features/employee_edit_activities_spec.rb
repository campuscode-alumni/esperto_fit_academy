require 'rails_helper'

feature 'Employee edit activities' do
    scenario 'successfully' do
        activity = create(:activity, name: 'Alongamento', equipments: 'Tênis')
        employee = create(:employee)
        login_as(employee, scope: :employee)

        visit root_path

        click_on 'Listas'
        click_on 'Lista de Aulas'
        click_on activity.name
        click_on 'Editar'

        fill_in 'Dificuldade', with: 'Difícil'
        click_on 'Atualizar Aula'

        expect(page).to have_css('h3', text: activity.name)
        expect(page).to have_css('p', text: activity.equipments)
        expect(page).to have_css('p', text: 'Difícil')
        expect(page).to have_content('Alterações realizadas com sucesso!')
    end

    scenario 'and unathenticated user cant see button' do
        activity = create(:activity, name: 'Alongamento')
        
        visit activities_path

        expect(current_path).to eq new_employee_session_path
    end

    scenario 'and must fill all fields' do
        activity = create(:activity, name: 'Alongamento')
        employee = create(:employee)
        login_as(employee, scope: :employee)

        visit root_path

        click_on 'Lista de Aulas'
        click_on activity.name
        click_on 'Editar'

        fill_in 'Nome', with: ''
        click_on 'Atualizar Aula'

        expect(page).not_to have_content('Nome atualizada com sucesso!')
        expect(page).to have_content('Nome não pode ficar em branco')
    end

    scenario 'and name must be unique' do
        trainer = create(:trainer)
        activity = create(:activity, name: 'Alongamento', trainer: trainer)
        other_activity = create(:activity, name: 'Zumba', trainer: trainer)
        employee = create(:employee)
        login_as(employee, scope: :employee)

        visit root_path

        click_on 'Lista de Aulas'
        click_on activity.name
        click_on 'Editar'

        fill_in 'Nome', with: other_activity.name
        click_on 'Atualizar Aula'

        expect(page).not_to have_content('Nome atualizada com sucesso!')
        expect(page).to have_content('Nome já está em uso')
    end
    
end