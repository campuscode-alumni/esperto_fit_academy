class Api::V1::GymsController < Api::V1::ApiController
  def index
    @gyms = Gym.all 
    if @gyms.empty?
      render json:  {messages:'Nenhuma unidade cadastrada'}, status: :not_found
    else
      render json: @gyms, status: 200
    end
    
    
    
  end
end