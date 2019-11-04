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
      flash[:success] = 'Funcionario cadastrado com sucesso!'
      redirect_to @employee
    else
      flash.now[:alert] = 'Funcionario não cadastrado'
      render :new
    end
  end

  def show
    @employee = Employee.find(params[:id]).decorate
    #@demployee = EmployeeDecorator.new(@employee)    
    redirect_to root_path unless current_employee == @employee || current_employee.admin?
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update(employee_params)
      flash[:success] = 'Funcionario alterado com sucesso!'
      redirect_to @employee
    else
      flash.now[:alert] = 'Funcionario não alterado'
      render :edit
    end
  end

  def change_status
    @employee = Employee.find(params[:id])
    if @employee.status == 'active'
      @employee.unactive!
      flash[:success] = 'Funcionario inativado com sucesso!'
    else
      @employee.active!
      flash[:success] = 'Funcionario ativado com sucesso!'
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
