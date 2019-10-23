class BanishedClientSerializer
    include FastJsonapi::ObjectSerializer

    attributes :cpf, :status
end