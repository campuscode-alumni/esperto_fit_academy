class PlansController < ApplicationController
  before_action :authenticate_employee! 
  before_action :verify_admin, only: %i[new create show management] 

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

  def management
    @plans = Plan.all
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    @plan = Plan.find(params[:id])
    if @plan.update(plan_params)
      flash[:message] = "Alterações realizadas com sucesso"
      redirect_to @plan
    else
      flash.now[:message] = @plan.errors.full_messages
      render :edit
    end
     
  end



  private
  def plan_params
    params.require(:plan).permit(:name, :minimum_permanence)
  end

  def verify_admin
    redirect_to root_path unless current_employee.admin?
  end
end