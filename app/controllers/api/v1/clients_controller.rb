class Api::V1::ClientsController < Api::V1::ApiController

  
  def create
    @client = Client.new(client_params)
    @client.save
    render json: @client, status: :created
  end

  private

  def client_params
    params.require(:client).permit(:name, :cpf, :email, :gym_id, :plan_id)
  end
end