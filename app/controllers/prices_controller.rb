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
      NotifyCreatedPlan.call(@price)
      flash[:notice] = t(:price_create, scope:[:notice], 
      price_name: @price.plan.name, price_gym_name: @price.gym.name, 
      price_format: @price.price_format)
      redirect_to new_price_path
    else
      redirect_to new_price_path, alert: t(:price_fail_create, 
      scope:[:alert])
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