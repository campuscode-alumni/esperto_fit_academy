class Api::V1::ActivitiesController < Api::V1::ApiController
  def index
    @gym = Gym.find(params[:gym_id])
    @activities = @gym.activities
    render json: ActivitySerializer.new(@activities).serialized_json, status: 200
  rescue ActiveRecord::RecordNotFound
    render json: {messages: 'Nenhuma classe cadastrada'}, status: :not_found
  end
end