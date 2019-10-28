class EmployeesController < ApplicationController
  before_action :authenticate_employee!
  before_action :verify_admin, only: %i[new create edit update index change_status unactives]

  def index
    @employees = Employee.where(status: 'active')
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      redirect_to @employee, notice: t(:success_create,
      scope:[:notice], models: Employee.model_name.human)
    else
      flash.now[:alert] = t(:fail_create, scope:[:alert],
      models: Employee.model_name.human)
      render :new
    end
  end

  def show
    @employee = Employee.find(params[:id])
    redirect_to root_path unless current_employee == @employee || current_employee.admin?
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update(employee_params)
      redirect_to @employee, notice: t(:success_updates,
      scope:[:notice], models: Employee.model_name.human)
    else
      flash.now[:alert] = t(:fail_update, 
      scope:[:alert], models: Employee.model_name.human)
      render :edit
    end
  end

  def change_status
    @employee = Employee.find(params[:id])
    if @employee.status == 'active'
      @employee.unactive!
      flash[:notice] = t(:employee_unactive,
      scope: [:notice], models: Employee.model_name.human)
    else
      @employee.active!
      flash[:notice] = t(:employee_active,
      scope: [:notice], models: Employee.model_name.human)
    end
    redirect_to @employee
  end

  def unactives
    @employees = Employee.where(status: 'unactive')
  end

  private
  def employee_params
    params.require(:employee).permit(:name, :gym_id, :status, :email, :admin, :password)
  end

  def verify_admin
    redirect_to root_path unless current_employee.admin?
  end
end
