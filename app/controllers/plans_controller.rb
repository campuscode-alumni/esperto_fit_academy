class PlansController < ApplicationController
  before_action :authenticate_employee! 
  before_action :authorize_admin
  before_action :find_id, only: %i[show edit update destroy]

  def new 
    @plan = Plan.new 
  end

  def create
    @plan = Plan.new(plan_params) 
    if @plan.save
      redirect_to @plan, notice: t(:success_create, 
      scope: [:notice], models: Plan.model_name.human)
    else
      flash.now[:message] = @plan.errors.full_messages
      render :new
    end
  end

  def show;  end

  def index
    @plans = Plan.all
  end

  def edit;  end

  def update
    if @plan.update(plan_params)
      redirect_to @plan, notice: t(:success_update, 
      scope: [:notice], models: Plan.model_name.human)
    else
      flash.now[:message] = @plan.errors.full_messages
      render :edit
    end
     
  end

  def destroy
    @plan.destroy
    redirect_to plans_path
  end

  private
  
  def plan_params
    params.require(:plan).permit(:name, :minimum_permanence)
  end

  def find_id
    @plan = Plan.find(params[:id])
  end

end