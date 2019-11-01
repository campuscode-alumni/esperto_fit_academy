module EmployeeHelper
  def admin_user(current_employee)
    return render 'layouts/navbar_partial1' if current_employee.admin?

    render 'layouts/navbar_partial2'
  end
end