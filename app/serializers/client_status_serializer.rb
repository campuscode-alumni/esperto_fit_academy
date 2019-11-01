class ClientStatusSerializer
  include FastJsonapi::ObjectSerializer

  attributes :cpf, :status
end