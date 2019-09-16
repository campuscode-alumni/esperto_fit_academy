class Api::V1::ClientsController < Api::V1::ApiController

  def consult_cpf
    @client = Client.find_by(cpf: params[:cpf])
    return render json: 'CPF não encontrado', status: 404 unless @client

    render json: @client.to_json(only: [:cpf, :status]), status: 302
  end
  
  def create
    @client = Client.new(client_params)
    if @client.save
      render json: @client, status: :created
    else
      render json: { message: "Não foi possivel cadastrar esse aluno", errors: @client.errors.full_messages }, status: :precondition_failed
    end
  end

  private

  def client_params
    params.require(:client).permit(:name, :cpf, :email, :gym_id, :plan_id)
  end
end