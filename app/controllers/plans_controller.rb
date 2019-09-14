class PlansController < ApplicationController
  before_action :authenticate_employee! 
  before_action :verify_admin, only: %i[new create show edit update management] 
  before_action :find_id, only: %i[show edit update]

  def new 
    @plan = Plan.new 
  end

  def create
    @plan = Plan.new(plan_params) 
    if @plan.save
      flash[:notice] = 'Plano cadastrado com sucesso!'
      redirect_to @plan 
    else
      flash.now[:alert] = 'Não foi possível cadastrar o plano'
      render :new
    end
  end

  def show 
  end

  def management
    @plans = Plan.all
  end

  def edit
  end

  def update
    if @plan.update(plan_params)
      flash[:success] = "Alterações realizadas com sucesso"
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

  def find_id
    @plan = Plan.find(params[:id])
  end

end