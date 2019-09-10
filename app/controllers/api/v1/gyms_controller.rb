class Api::V1::GymsController < Api::V1::ApiController
  def show
    if @gym.accepted? || @gym.employee == current_employee || (employee_signed_in? && current_employee.admin)
      @employee = current_employee
      @lists = Gym.where(employee: current_employee)
      @gym_list = Gym.new
    else
      redirect_to root_path
    end
  end
end
