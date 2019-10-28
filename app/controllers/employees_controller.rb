class EmployeesController < ApplicationController
  before_action :authenticate_employee!
  before_action :authorize_admin, only: %i[new create edit update index change_status unactives]
  before_action :find_employee_by_id, only: %i[show edit update change_status]

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
    redirect_to root_path unless current_employee == @employee || current_employee.admin?
  end

  def edit; end

  def update
    if @employee.update(employee_params)
      redirect_to @employee, notice:  t(:success_update,
      scope:[:notice], models: Employee.model_name.human)
    else
      flash.now[:alert] = t(:fail_update, scope:[:alert],
      models: Employee.model_name.human)
      render :edit
    end
  end

  def change_status
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

  def find_employee_by_id
    @employee ||= Employee.find(params[:id])
  end
end
