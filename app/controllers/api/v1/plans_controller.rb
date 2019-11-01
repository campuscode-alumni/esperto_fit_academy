module Api
  module V1 
    class PlansController < ApiController
      def index
        gym = Gym.find(params[:gym_id])
        plan = gym.plans
        @price = Price.where(plan: plan, gym: gym)
        render json: PriceSerializer.new(@price).serialized_json, status: :ok
      rescue ActiveRecord::RecordNotFound  
        render json: { messages: 'Nenhum plano cadastrado' }, status: :not_found
      end

      def show_all
        plans = Plan.all
        return render json: { menssages: 'Nenhum plano encontrado' }, status: :not_found if plans.empty?

        render json: PlanSerializer.new(plans).serialized_json, status: :ok
      end

      def show 
        plan = Plan.find(params[:id])
        render json: { plan: { name: plan.name, minimum_permanence: plan.minimum_permanence } }
      
      rescue ActiveRecord::RecordNotFound
        render json: { menssages: 'Nenhum plano encontrado' }, status: :not_found
      end
    end
  end
end