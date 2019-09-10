class PricesController < ApplicationController
  before_action :authenticate_employee!
  before_action :verify_admin
  before_action :load_data

  def new
    @price = Price.new
  end

  def create
    @price = Price.new(price_params)
    if @price.save
      flash[:notice] = "O plano #{@price.plan.name} na unidade #{@price.gym.name} foi dado o valor de #{@price.price_format} com sucesso!"
      redirect_to new_price_path
    else
      flash[:alert] = 'Você deve preencher todos os campos'
      redirect_to new_price_path
    end
  end

  private

  def price_params
    params.require(:price).permit(:gym_id, :plan_id, :value)
  end

  def load_data
    @gyms = Gym.all
    @plans = Plan.all
  end

  def verify_admin
    redirect_to root_path unless current_employee.admin?
  end

end