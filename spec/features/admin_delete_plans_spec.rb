require 'rails_helper'

feature 'Admin delete plans' do
  scenario 'successfully' do
    admin = create(:employee, admin: true)
    plan_basic = create(:plan, name: 'Básico', minimum_permanence: 10)
    plan_premium = create(:plan, name: 'Premium', minimum_permanence: 10)
  
    # act
    login_as admin

    visit root_path
    click_on 'Gerenciar Planos'
    click_on 'Básico'
    click_on 'Deletar Plano'

    # asssert
    expect(current_path).to eq plans_path
    expect(page).to have_content('Premium')
    expect(page).not_to have_content('Básico')  
  end

end
