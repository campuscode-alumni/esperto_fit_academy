class EmployeeDecorator < Draper::Decorator
  delegate :admin, :id, :name, :gym, :translate_status, :email
  def admin_option
    admin ? 'Admin: Sim' : 'Admin: Nao'
  end
end