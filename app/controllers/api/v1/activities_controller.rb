module Api
  module V1
    class ActivitiesController < ApiController
      def index
        gym = Gym.find(params[:gym_id])
        activities = gym.activities
        render json: ActivitySerializer.new(activities).serialized_json, status: :ok
      rescue ActiveRecord::RecordNotFound
        render json: { messages: 'Nenhuma classe cadastrada' }, status: :not_found
      end
    end
  end
end