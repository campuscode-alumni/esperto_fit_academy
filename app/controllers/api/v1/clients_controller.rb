class Api::V1::ClientsController < Api::V1::ApiController

  
  def create
    @client = Client.new(client_params)
    if @client.save
      render json: @client, status: :created
    else
      render json: { message: "Não foi possivel cadastrar esse aluno", errors: @client.errors.full_messages }, status: :precondition_failed
    end
  end

  def show
    @client = Client.find_by(cpf: params[:cpf])
    return render json: 'Cliente não encontrado', status: 404 unless @client

    render json: @client, status: 302
  end

  private

  def client_params
    params.require(:client).permit(:name, :cpf, :email, :gym_id, :plan_id)
  end
end