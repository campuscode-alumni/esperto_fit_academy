class Api::V1::ClientsController < Api::V1::ApiController
  def consult_cpf
    @client = Client.find_by(cpf: params[:cpf])
    return render json: { message: 'CPF não encontrado' }, status: :not_found unless @client
    render json: @client, serializer: SimpleClientSerializer, status: :found
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      render json: @client, status: :created
    else
      render json: { message: 'Não foi possivel cadastrar esse aluno', errors: @client.errors.full_messages }, status: :precondition_failed
    end
  end

  def show
    @client = Client.find_by(cpf: params[:cpf])
    return render json: { message: 'Cliente não encontrado' }, status: :not_found unless @client

    render json: @client, status: :found
  end

  def inactivate
    @client = Client.find_by(cpf: params[:cpf])
    return render json: { message: 'CPF não encontrado' }, status: :not_found unless @client

    @client.inactive! if @client.active?
    render json: @client,serializer: SimpleClientSerializer , status: :accepted
  end

  private

  def client_params
    params.require(:client).permit(:name, :cpf, :email, :gym_id, :plan_id)
  end
end
