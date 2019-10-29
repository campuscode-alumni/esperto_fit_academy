class EmployeeDecorator < SimpleDelegator

    def admin_option
        admin? ? "Admin: Sim" : "Admin: Nao"
    end

end