class Api::V1::ActivitiesController < Api::V1::ApiController
  def index
    @gym = Gym.find(params[:gym_id])
    @activities = @gym.activities
    render json: @activities, status: 200
  rescue StandardError => e
    Rails.logger.error(e.message)
    render json: {messages: 'Nenhuma classe cadastrada'}, status: :not_found
  end
end 