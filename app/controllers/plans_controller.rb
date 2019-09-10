class PlansController < ApplicationController
  before_action :authenticate_employee! 
  before_action :verify_admin, only: %i[new create show] 

  def new 
    @plan = Plan.new 
  end

  def create
    @plan = Plan.new(plan_params) 
    if @plan.save
      flash[:notice] = 'Plano cadastrado com sucesso!'
      redirect_to @plan 
    else
      flash[:alert] = 'Não foi possível cadastrar o plano'
      render :new
    end
  end

  def show
    @plan = Plan.find(params[:id])
  end



  private
  def plan_params
    params.require(:plan).permit(:name, :minimum_permanence)
  end

  def verify_admin
    redirect_to root_path unless current_employee.admin?
  end
end