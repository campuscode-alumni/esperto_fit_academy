class Api::V1::GymsController < Api::V1::ApiController
  respond_to :json

  def index
    @gyms = Gym.all 
    if @gyms.empty?
      render json:  {messages:'Nenhuma unidade cadastrada'}, status: :not_found
    else
      render json: @gyms, status: 200
    end
  end

  def show
    @gym = Gym.find(params[:id])

    render json: {gym: @gym.as_json.merge(images: build_images)}, status: 200
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'Academia não encontrada'}, status: 404
  end

  def destroy
    @gym = Gym.find(params[:id])
    if current_employee.admin?
      @gym.destroy
      render json: { msg: 'Academia apagada com sucesso' }, status: :accepted
    else
      render json: { msg: 'Você não tem essa permissão' }, status: :precondition_failed
    end
  end

  private

  def build_images
    @gym.gallery.map {|image| url_for(image)}
  end

  def authenticated?
    @authenticated || unauthorized
  end

  def unauthorized
    head :unauthorized
  end

end
