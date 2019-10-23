class ClientSerializer
    include FastJsonapi::ObjectSerializer

    attributes :name, :email, :cpf, :gym_id, :plan_id, :status
end