class Api::V1::PlansController < Api::V1::ApiController
  def index
    @gym = Gym.find(params[:gym_id])
    @plans = @gym.plans
    render json: {plans: build_gym_plans(@plans, @gym)}, status: 200
  rescue ActiveRecord::RecordNotFound  
    render json:  {messages:'Nenhum plano cadastrado'}, status: :not_found
  end

  private

  def build_gym_plans(plans, gym)
    plans.map do |plan|
      price = Price.find_by(plan: plan, gym: gym).value
      plan.as_json.merge(price: price)
    end
  end
end
