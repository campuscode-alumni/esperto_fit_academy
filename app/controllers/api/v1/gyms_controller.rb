class Api::V1::GymsController < Api::V1::ApiController
  def index
    @gyms = Gym.all 
    render json: @gyms, status: 200
  end
end