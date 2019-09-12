class Api::V1::ClientsController < Api::V1::ApiController

  def consult_cpf
    @client = Client.find_by(cpf: params[:cpf])
    return render json: 'CPF não encontrado', status: 404 unless @client

    render json: @client.to_json(only: [:cpf, :status]), status: 302
  end
end