class Api::V1::PlansController < Api::V1::ApiController

  def index
    @gym = Gym.find(params[:gym_id])
    @plans = @gym.plans
    render json: {plans: build_gym_plans(@plans, @gym)}, status: 200
  rescue ActiveRecord::RecordNotFound  
    render json:  {messages:'Nenhum plano cadastrado'}, status: :not_found
  end

  def show_all
    @plans = Plan.all
    return render json: {menssages: 'Nenhum plano encontrado'}, status: :not_found if @plans.empty?
    render json: @plans, status: :ok
  end

  def show 
    @plan = Plan.find(params[:id])
    render json: { plan: { name: @plan.name, minimum_permanence: @plan.minimum_permanence } }
  
  rescue ActiveRecord::RecordNotFound
    render json: {menssages: 'Nenhum plano encontrado'}, status: :not_found
  end


end

private

  def build_gym_plans(plans, gym)
    plans.map do |plan|
      price = Price.find_by(plan: plan, gym: gym).value
      plan.as_json.merge(price: price)
    end
  end



