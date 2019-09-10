class ClientsController < ApplicationController
  before_action :find_all, only: %i[create update]
  before_action :find_id, only: %i[show edit update]

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)

    if @client.save
      flash[:notice] = 'Matriculado com sucesso!'
      redirect_to @client
    else
      find_all
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @client.update(client_params)
      flash[:notice] = 'Atualizado com sucesso!'
      redirect_to @client
    else
      find_all
      render :edit
    end
  end

  private

  def client_params
    params.require(:client).permit(:name, :cpf, :email, :gym_id, :plan_id)
  end

  def find_all
    @gym = Gym.all
    @plan = Plan.all
  end

  def find_id
    @client = Client.find(params[:id])
  end
end