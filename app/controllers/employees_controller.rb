class EmployeesController < ApplicationController
  before_action :authenticate_employee! 
  before_action :verify_admin, only: %i[new create]

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
    @employee = Employee.find(params[:id])
  end

  private
  def employee_params
    params.require(:employee).permit(:name, :gym, :status, :email, :admin, :password)
  end

  def verify_admin
    redirect_to root_path unless current_employee.admin?
  end
end