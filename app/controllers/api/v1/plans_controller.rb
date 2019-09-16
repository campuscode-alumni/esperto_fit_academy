class Api::V1::PlansController < Api::V1::ApiController
  def index
    @gym = Gym.find(params[:gym_id])
    @price = Price.where(gyms: @gym)
    @plans = @gym.plans
    if @gym.nil?
      render json:  {messages:'Nenhum plano cadastrado'}, status: :not_found
    else
      render json: @plans, status: 200, include: ['prices']
    end
  end
end
