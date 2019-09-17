class Api::V1::PlansController < Api::V1::ApiController

  def index
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

