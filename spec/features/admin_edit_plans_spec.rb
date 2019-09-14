require 'rails_helper'

feature 'Admin edit plans' do
    scenario 'successffuly' do
        admin = create(:employee, admin: true)
        plan_basic = create(:plan, name: 'Simples', minimum_permanence: 10)
        plan_premium = create(:plan, name: 'Premium', minimum_permanence: 10)

        login_as admin

        visit root_path
        click_on 'Gerenciar Planos'
        click_on 'Simples'
        click_on 'Editar'

        fill_in 'Nome', with: 'Básico'
        fill_in 'Permanência mínima', with: '90'
        click_on 'Salvar'

        expect(current_path).to eq plan_path(plan_basic)
        expect(page).to have_content('Básico')
        expect(page).to have_content('Permanência mínima: 90 meses')
        expect(page).not_to have_content('Simples')
        expect(page).not_to have_content('Permanência mínima: 10')    
    end

    scenario 'and filds cannot be empty' do
        admin = create(:employee, admin: true)
        plan_basic = create(:plan, name: 'Simples', minimum_permanence: 10)
        

        login_as admin

        visit root_path
        click_on 'Gerenciar Planos'
        click_on 'Simples'
        click_on 'Editar'

        fill_in 'Nome', with: ''
        fill_in 'Permanência mínima', with: '90'
        click_on 'Salvar'

        expect(page).to have_content('Nome Todos os campos devem ser preenchidos')
        expect(page).not_to have_content('Alterações realizadas com sucesso')    
    end

end