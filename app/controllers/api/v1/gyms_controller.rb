module Api
  module V1
    class GymsController < ApiController
      respond_to :json

      def index
        gyms = Gym.all 
        if gyms.empty?
          render json: { messages: 'Nenhuma unidade cadastrada' }, status: :not_found
        else
          render json: GymSerializer.new(gyms).serialized_json, status: :ok
        end
      end

      def show
        gym = Gym.find(params[:id])

        render json: GymSerializer.new(gym).serialized_json, status: :ok
      rescue ActiveRecord::RecordNotFound
        render json: { message: 'Academia não encontrada' }, status: :not_found
      end

      def destroy
        gym = Gym.find(params[:id])
        if current_employee.admin?
          gym.destroy
          render json: { msg: 'Academia apagada com sucesso' }, status: :accepted
        else
          render json: { msg: 'Você não tem essa permissão' }, status: :precondition_failed
        end
      end

      private

      def authenticated?
        @authenticated || unauthorized
      end

      def unauthorized
        head :unauthorized
      end
    end
  end
end
