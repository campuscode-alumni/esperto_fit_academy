class Api::V1::GymsController < Api::V1::ApiController
  def show
    @gym = Gym.find(params[:id])
    render json: @gym, status: 200
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'Academia não encontrada'}, status: 404
  end
end
